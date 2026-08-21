#!/usr/bin/env python3
"""Probe screenshot pixels to verify what a colorscheme actually renders.

Reading colors off a screenshot by eye does not work. Two near black surfaces
look identical, and a highlight group with no `bg` silently falls back to
something you did not expect. This decodes the image and reports exact values,
optionally labelled with the ofirkai scheme key they came from.

No third party deps, PNG is decoded in pure Python. Non PNG input is converted
with `sips` (macOS) automatically.

    ./pxprobe.py info shot.png
    ./pxprobe.py at shot.png 600,400 1700,22
    ./pxprobe.py row shot.png 28 --scheme dark_blue
    ./pxprobe.py col shot.png 40
    ./pxprobe.py hist shot.png 1000,176 1980,196
    ./pxprobe.py rows shot.png 1085 1400
    ./pxprobe.py contrast '#9ca0a4' '#0f1018'

`row` and `col` are the workhorses. They collapse a line of pixels into runs of
solid color, which is how you find a block that should not be there:

    == row y=28  x 0..1329 ==
       x    31-  183  w=  153  #090c10  ~background(+1)   <- the title cell
       x   184- 1312  w= 1129  #0f1017  ~picker_bg(+1)    <- the panel

A title, count or gutter rendering in `background` instead of `picker_bg` means
its highlight group has no `bg` of its own and fell back to the global `Normal`.
Fix it with an explicit bg, or remap the group per window via `winhighlight`.

Matches are reported with the per channel delta, `~name(+1)` is a screenshot
rounding artefact, `~name(+8)` is probably a blended or antialiased pixel. Ties
are all listed because themes alias colors.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import pickle
import shutil
import struct
import subprocess
import tempfile
import zlib
from collections import Counter

CACHE_DIR = os.path.join(tempfile.gettempdir(), "pxprobe-cache")

# Tolerance for calling a sampled pixel "the same as" a scheme color. Screenshots
# are not lossless, antialiasing and display profiles shift values by a point or
# two, so an exact match is too strict. Anything non exact is reported with its
# per channel delta so a near miss cannot masquerade as a match.
SCHEME_TOLERANCE = 8


# --------------------------------------------------------------------------
# PNG decoding
# --------------------------------------------------------------------------

CHANNELS = {0: 1, 2: 3, 3: 1, 4: 2, 6: 4}


class Image:
    def __init__(self, width: int, height: int, rgb: bytes):
        self.width = width
        self.height = height
        self.rgb = rgb  # 3 bytes per pixel, row major

    def at(self, x: int, y: int) -> tuple[int, int, int]:
        if not (0 <= x < self.width and 0 <= y < self.height):
            raise SystemExit(f"point {x},{y} is outside the {self.width}x{self.height} image")
        o = (y * self.width + x) * 3
        return self.rgb[o], self.rgb[o + 1], self.rgb[o + 2]


def _unfilter(raw: bytes, width: int, height: int, nch: int, depth: int) -> bytearray:
    """Reverse the per scanline PNG filters. See RFC 2083 section 6."""
    bpp = max(1, nch * depth // 8)
    stride = (width * nch * depth + 7) // 8
    out = bytearray()
    prev = bytearray(stride)
    pos = 0
    for _ in range(height):
        ftype = raw[pos]
        pos += 1
        line = bytearray(raw[pos : pos + stride])
        pos += stride
        if ftype == 1:
            for i in range(bpp, stride):
                line[i] = (line[i] + line[i - bpp]) & 0xFF
        elif ftype == 2:
            for i in range(stride):
                line[i] = (line[i] + prev[i]) & 0xFF
        elif ftype == 3:
            for i in range(stride):
                a = line[i - bpp] if i >= bpp else 0
                line[i] = (line[i] + ((a + prev[i]) >> 1)) & 0xFF
        elif ftype == 4:
            for i in range(stride):
                a = line[i - bpp] if i >= bpp else 0
                b = prev[i]
                c = prev[i - bpp] if i >= bpp else 0
                p = a + b - c
                pa, pb, pc = abs(p - a), abs(p - b), abs(p - c)
                pred = a if (pa <= pb and pa <= pc) else (b if pb <= pc else c)
                line[i] = (line[i] + pred) & 0xFF
        elif ftype != 0:
            raise SystemExit(f"unknown PNG filter type {ftype}")
        out += line
        prev = line
    return out


def _to_rgb(buf: bytearray, width: int, height: int, ctype: int, depth: int, plte: bytes) -> bytes:
    nch = CHANNELS[ctype]
    step = depth // 8
    stride = width * nch * step

    if ctype == 3:
        if not plte:
            raise SystemExit("indexed PNG has no PLTE chunk")
        if depth != 8:
            raise SystemExit(f"indexed PNG with bit depth {depth} is not supported, re-save as 8 bit")
        out = bytearray(width * height * 3)
        for i in range(width * height):
            idx = buf[i] * 3
            out[i * 3 : i * 3 + 3] = plte[idx : idx + 3]
        return bytes(out)

    out = bytearray(width * height * 3)
    for y in range(height):
        row = y * stride
        for x in range(width):
            o = row + x * nch * step
            if ctype in (0, 4):  # grayscale, alpha ignored
                v = buf[o]
                px = (v, v, v)
            else:  # 2 or 6, alpha ignored
                px = (buf[o], buf[o + step], buf[o + 2 * step])
            d = (y * width + x) * 3
            out[d], out[d + 1], out[d + 2] = px
    return bytes(out)


def _decode_png(path: str) -> Image:
    data = open(path, "rb").read()
    if data[:8] != b"\x89PNG\r\n\x1a\n":
        raise ValueError("not a PNG")

    pos = 8
    width = height = depth = ctype = None
    idat = bytearray()
    plte = b""
    while pos < len(data):
        (length,) = struct.unpack(">I", data[pos : pos + 4])
        ctag = data[pos + 4 : pos + 8]
        chunk = data[pos + 8 : pos + 8 + length]
        if ctag == b"IHDR":
            width, height, depth, ctype, _, _, interlace = struct.unpack(">IIBBBBB", chunk[:13])
            if interlace:
                raise SystemExit("interlaced PNG is not supported, re-save without Adam7")
            if ctype not in CHANNELS:
                raise SystemExit(f"unsupported PNG color type {ctype}")
            if depth not in (8, 16) and ctype != 3:
                raise SystemExit(f"unsupported PNG bit depth {depth}")
        elif ctag == b"PLTE":
            plte = chunk
        elif ctag == b"IDAT":
            idat += chunk
        elif ctag == b"IEND":
            break
        pos += 12 + length

    if width is None or height is None or depth is None or ctype is None:
        raise SystemExit("PNG has no IHDR")
    if not idat:
        raise SystemExit("PNG has no image data")
    raw = zlib.decompress(bytes(idat))
    buf = _unfilter(raw, width, height, CHANNELS[ctype], depth)
    return Image(width, height, _to_rgb(buf, width, height, ctype, depth, plte))


def load(path: str, no_cache: bool = False) -> Image:
    if not os.path.exists(path):
        raise SystemExit(f"no such file: {path}")

    st = os.stat(path)
    key = hashlib.sha1(f"{os.path.realpath(path)}:{st.st_mtime_ns}:{st.st_size}".encode()).hexdigest()
    cache = os.path.join(CACHE_DIR, key + ".pkl")
    if not no_cache and os.path.exists(cache):
        try:
            with open(cache, "rb") as fh:
                w, h, rgb = pickle.load(fh)
            return Image(w, h, rgb)
        except Exception:
            pass  # corrupt cache entry, decode again

    try:
        img = _decode_png(path)
    except ValueError:
        if not shutil.which("sips"):
            raise SystemExit(f"{path} is not a PNG and `sips` is unavailable to convert it")
        with tempfile.NamedTemporaryFile(suffix=".png", delete=False) as tmp:
            conv = tmp.name
        try:
            res = subprocess.run(
                ["sips", "-s", "format", "png", path, "--out", conv],
                stdout=subprocess.DEVNULL,
                stderr=subprocess.PIPE,
                text=True,
            )
            if res.returncode != 0:
                detail = (res.stderr or "").strip().splitlines()
                raise SystemExit(f"sips could not read {path} as an image" + (f": {detail[-1]}" if detail else ""))
            try:
                img = _decode_png(conv)
            except ValueError:
                raise SystemExit(f"sips converted {path} but the result is not a readable PNG")
        finally:
            os.unlink(conv)

    if not no_cache:
        os.makedirs(CACHE_DIR, exist_ok=True)
        with open(cache, "wb") as fh:
            pickle.dump((img.width, img.height, img.rgb), fh)
    return img


# --------------------------------------------------------------------------
# Color math
# --------------------------------------------------------------------------


def parse_hex(s: str) -> tuple[int, int, int]:
    s = s.strip().lstrip("#")
    if len(s) == 3:
        s = "".join(c * 2 for c in s)
    if len(s) != 6:
        raise SystemExit(f"bad color {s!r}, expected #rrggbb")
    return tuple(int(s[i : i + 2], 16) for i in (0, 2, 4))  # type: ignore[return-value]


def to_hex(c: tuple[int, int, int]) -> str:
    return "#%02x%02x%02x" % c


def luminance(c: tuple[int, int, int]) -> float:
    def lin(v: float) -> float:
        v /= 255
        return v / 12.92 if v <= 0.04045 else ((v + 0.055) / 1.055) ** 2.4

    return 0.2126 * lin(c[0]) + 0.7152 * lin(c[1]) + 0.0722 * lin(c[2])


def contrast(a: tuple[int, int, int], b: tuple[int, int, int]) -> float:
    la, lb = luminance(a), luminance(b)
    hi, lo = max(la, lb), min(la, lb)
    return (hi + 0.05) / (lo + 0.05)


def blue_lean(c: tuple[int, int, int]) -> float:
    """B/R ratio. Surfaces of one design should share it, a neutral grey block
    dropped on a blue tinted panel is the classic 'looks pasted on' bug."""
    return c[2] / max(c[0], 1)


# --------------------------------------------------------------------------
# ofirkai scheme labelling
# --------------------------------------------------------------------------

_LUA_DUMP = r"""
vim.opt.rtp:prepend(vim.fn.getcwd())
vim.opt.termguicolors = true
local theme = os.getenv('PXPROBE_THEME')
require('ofirkai').setup({ theme = (theme ~= '' and theme) or nil })
local out = {}
local function walk(t, prefix)
  for k, v in pairs(t) do
    if type(v) == 'string' and v:match('^#%x%x%x%x%x%x$') then
      out[prefix .. k] = v:lower()
    elseif type(v) == 'table' then
      walk(v, prefix .. k .. '.')
    end
  end
end
walk(require('ofirkai').scheme, '')
io.write(vim.json.encode(out))
"""


def load_scheme(theme: str, repo: str) -> dict[str, str]:
    """Dump ofirkai's resolved scheme by running it in headless nvim."""
    if not shutil.which("nvim"):
        raise SystemExit("--scheme needs nvim on PATH")
    if not os.path.isdir(os.path.join(repo, "lua", "ofirkai")):
        raise SystemExit(f"--scheme must run from an ofirkai checkout, {repo} is not one (use --repo)")
    with tempfile.NamedTemporaryFile("w", suffix=".lua", delete=False) as fh:
        fh.write(_LUA_DUMP)
        script = fh.name
    try:
        env = dict(os.environ, PXPROBE_THEME="" if theme == "default" else theme)
        res = subprocess.run(
            ["nvim", "--headless", "-u", "NONE", "-l", script],
            capture_output=True,
            text=True,
            cwd=repo,
            env=env,
        )
    finally:
        os.unlink(script)
    blob = res.stdout.strip() or res.stderr.strip()
    start = blob.find("{")
    if start < 0:
        raise SystemExit(f"could not read the scheme from nvim:\n{blob}")
    return json.loads(blob[start:])


class Labeller:
    """Maps a pixel back to the scheme key it most likely came from."""

    def __init__(self, scheme: dict[str, str] | None):
        self.entries = []
        if scheme:
            for name, hexval in sorted(scheme.items()):
                try:
                    self.entries.append((name, parse_hex(hexval)))
                except SystemExit:
                    continue

    def __call__(self, c: tuple[int, int, int]) -> str:
        if not self.entries:
            return ""
        scored = [(max(abs(a - b) for a, b in zip(c, rgb)), name) for name, rgb in self.entries]
        best_d = min(d for d, _ in scored)
        if best_d > SCHEME_TOLERANCE:
            return ""
        # Themes alias colors (picker_bg, chat_bg and telescope_bg share a value),
        # so report every key that ties rather than an arbitrary one.
        names = [n for d, n in scored if d == best_d]
        joined = "=".join(names[:3]) + ("=..." if len(names) > 3 else "")
        return joined if best_d == 0 else f"~{joined}(+{best_d})"


def fmt(c: tuple[int, int, int], label: Labeller) -> str:
    name = label(c)
    return f"{to_hex(c)}  {name}" if name else to_hex(c)


# --------------------------------------------------------------------------
# Scanning
# --------------------------------------------------------------------------


def runs(values, start_index: int, min_run: int):
    """Collapse a sequence into (start, end, value) runs of at least min_run."""
    out = []
    cur = None
    start = start_index
    for i, v in enumerate(values):
        if v != cur:
            if cur is not None and (i + start_index) - start >= min_run:
                out.append((start, i + start_index - 1, cur))
            cur = v
            start = i + start_index
    if cur is not None and (len(values) + start_index) - start >= min_run:
        out.append((start, len(values) + start_index - 1, cur))
    return out


def parse_point(s: str) -> tuple[int, int]:
    try:
        x, y = s.replace(" ", "").split(",")
        return int(x), int(y)
    except ValueError:
        raise SystemExit(f"bad point {s!r}, expected X,Y")


# --------------------------------------------------------------------------
# Subcommands
# --------------------------------------------------------------------------


def cmd_info(args, img: Image, label: Labeller) -> None:
    print(f"{img.width}x{img.height}")
    if args.logical_width:
        print(f"scale vs {args.logical_width} logical px: {img.width / args.logical_width:.3f}x")
        print("  multiply on-screen coordinates by this before probing")
    corners = {
        "top left": (0, 0),
        "top right": (img.width - 1, 0),
        "bottom left": (0, img.height - 1),
        "bottom right": (img.width - 1, img.height - 1),
        "center": (img.width // 2, img.height // 2),
    }
    for name, (x, y) in corners.items():
        print(f"  {name:<13} {fmt(img.at(x, y), label)}")


def cmd_at(args, img: Image, label: Labeller) -> None:
    for spec in args.points:
        x, y = parse_point(spec)
        print(f"({x:5d},{y:5d})  {fmt(img.at(x, y), label)}")


def cmd_row(args, img: Image, label: Labeller) -> None:
    x0 = args.x0 or 0
    x1 = args.x1 if args.x1 is not None else img.width
    x1 = min(x1, img.width)
    for y in args.y:
        print(f"== row y={y}  x {x0}..{x1 - 1} ==")
        vals = [img.at(x, y) for x in range(x0, x1)]
        found = runs(vals, x0, args.min_run)
        if not found:
            print(f"   no run of {args.min_run}+ px, lower --min-run")
        for a, b, c in found:
            print(f"   x {a:5d}-{b:5d}  w={b - a + 1:5d}  {fmt(c, label)}")


def cmd_col(args, img: Image, label: Labeller) -> None:
    y0 = args.y0 or 0
    y1 = args.y1 if args.y1 is not None else img.height
    y1 = min(y1, img.height)
    for x in args.x:
        print(f"== col x={x}  y {y0}..{y1 - 1} ==")
        vals = [img.at(x, y) for y in range(y0, y1)]
        found = runs(vals, y0, args.min_run)
        if not found:
            print(f"   no run of {args.min_run}+ px, lower --min-run")
        for a, b, c in found:
            print(f"   y {a:5d}-{b:5d}  h={b - a + 1:5d}  {fmt(c, label)}")


def cmd_hist(args, img: Image, label: Labeller) -> None:
    x0, y0 = parse_point(args.topleft)
    x1, y1 = parse_point(args.bottomright)
    x1, y1 = min(x1, img.width), min(y1, img.height)
    counter: Counter = Counter()
    for y in range(y0, y1):
        for x in range(x0, x1):
            counter[img.at(x, y)] += 1
    total = sum(counter.values()) or 1
    print(f"== hist {x0},{y0} .. {x1},{y1}  ({total} px) ==")
    for c, n in counter.most_common(args.top):
        print(f"   {n:8d}  {100 * n / total:5.1f}%  {fmt(c, label)}")


def cmd_rows(args, img: Image, label: Labeller) -> None:
    """Find text rows by counting pixels that differ from the row's own background.

    Useful when you do not know where a text row sits, glyph coordinates guessed
    from a scaled screenshot are almost always a few rows off.
    """
    x0 = args.x0 or 0
    x1 = args.x1 if args.x1 is not None else img.width
    x1 = min(x1, img.width)
    print(f"== text density  y {args.y0}..{args.y1}, x {x0}..{x1 - 1} ==")
    runs_out = []
    for y in range(args.y0, min(args.y1, img.height)):
        row = [img.at(x, y) for x in range(x0, x1)]
        bg = Counter(row).most_common(1)[0][0]
        n = sum(1 for c in row if max(abs(a - b) for a, b in zip(c, bg)) > args.threshold)
        runs_out.append((y, n, bg))
    active = [(y, n, bg) for y, n, bg in runs_out if n >= args.min_pixels]
    if not active:
        print(f"   nothing above --min-pixels {args.min_pixels}")
        return
    # group consecutive rows into bands so the output is one line per text row
    band_start, prev, peak, bg = active[0][0], active[0][0], active[0][1], active[0][2]
    for y, n, rowbg in active[1:] + [(None, 0, None)]:
        if y is not None and y == prev + 1:
            prev, peak = y, max(peak, n)
            continue
        print(f"   y {band_start:5d}-{prev:5d}  h={prev - band_start + 1:3d}  peak={peak:5d} px  bg {fmt(bg, label)}")
        if y is None:
            break
        band_start, prev, peak, bg = y, y, n, rowbg


def cmd_contrast(args, _img, label: Labeller) -> None:
    a, b = parse_hex(args.a), parse_hex(args.b)
    print(f"a {to_hex(a)}  lum {luminance(a):.5f}  B/R {blue_lean(a):.2f}")
    print(f"b {to_hex(b)}  lum {luminance(b):.5f}  B/R {blue_lean(b):.2f}")
    ratio = contrast(a, b)
    print(f"contrast {ratio:.2f}:1")
    if ratio < 3:
        note = "below 3:1, fine for a surface pair, too low for text"
    elif ratio < 4.5:
        note = "3:1, large text or UI edges only"
    elif ratio < 7:
        note = "4.5:1, passes AA for body text"
    else:
        note = "7:1, passes AAA for body text"
    print(f"  {note}")
    # Hue family only matters for a surface pair. For a text/background pair a
    # large B/R gap is normal and says nothing.
    dlean = abs(blue_lean(a) - blue_lean(b))
    if ratio < 3 and dlean > 0.3:
        print(f"  B/R differs by {dlean:.2f}, as a surface pair these will not read as the same family")


# --------------------------------------------------------------------------


def main() -> None:
    p = argparse.ArgumentParser(
        prog="pxprobe.py",
        description="Probe screenshot pixels to verify what a colorscheme renders.",
        epilog="Coordinates are image pixels. On a Retina capture that is 2x the on-screen "
        "position, run `info --logical-width` first to get the factor.",
    )
    sub = p.add_subparsers(dest="cmd", required=True)

    def with_image(name, help_text):
        sp = sub.add_parser(name, help=help_text)
        sp.add_argument("image")
        sp.add_argument("--scheme", metavar="THEME", help="label colors with ofirkai scheme keys, e.g. dark_blue or default")
        sp.add_argument("--repo", default=".", help="ofirkai checkout to read the scheme from (default: cwd)")
        sp.add_argument("--no-cache", action="store_true", help="skip the decoded pixel cache")
        return sp

    sp = with_image("info", "dimensions, Retina scale and corner colors")
    sp.add_argument("--logical-width", type=int, help="on-screen width, to compute the scale factor")
    sp.set_defaults(fn=cmd_info)

    sp = with_image("at", "sample individual points")
    sp.add_argument("points", nargs="+", metavar="X,Y")
    sp.set_defaults(fn=cmd_at)

    sp = with_image("row", "color runs across one or more rows")
    sp.add_argument("y", nargs="+", type=int)
    sp.add_argument("--x0", type=int)
    sp.add_argument("--x1", type=int)
    sp.add_argument("--min-run", type=int, default=6, help="ignore runs shorter than this (default: 6)")
    sp.set_defaults(fn=cmd_row)

    sp = with_image("col", "color runs down one or more columns")
    sp.add_argument("x", nargs="+", type=int)
    sp.add_argument("--y0", type=int)
    sp.add_argument("--y1", type=int)
    sp.add_argument("--min-run", type=int, default=6, help="ignore runs shorter than this (default: 6)")
    sp.set_defaults(fn=cmd_col)

    sp = with_image("hist", "color histogram of a region")
    sp.add_argument("topleft", metavar="X0,Y0")
    sp.add_argument("bottomright", metavar="X1,Y1")
    sp.add_argument("--top", type=int, default=8, help="how many colors to list (default: 8)")
    sp.set_defaults(fn=cmd_hist)

    sp = with_image("rows", "locate text rows by pixel density")
    sp.add_argument("y0", type=int)
    sp.add_argument("y1", type=int)
    sp.add_argument("--x0", type=int)
    sp.add_argument("--x1", type=int)
    sp.add_argument("--threshold", type=int, default=24, help="per channel delta from the row bg (default: 24)")
    sp.add_argument("--min-pixels", type=int, default=40, help="pixels needed to call a row 'text' (default: 40)")
    sp.set_defaults(fn=cmd_rows)

    sp = sub.add_parser("contrast", help="WCAG contrast and blue lean of two colors, no image needed")
    sp.add_argument("a")
    sp.add_argument("b")
    sp.set_defaults(fn=cmd_contrast, image=None, scheme=None, repo=".", no_cache=False)

    args = p.parse_args()
    img = load(args.image, args.no_cache) if args.image else None
    scheme = load_scheme(args.scheme, args.repo) if args.scheme else None
    args.fn(args, img, Labeller(scheme))


if __name__ == "__main__":
    try:
        main()
    except BrokenPipeError:
        os._exit(0)  # piped into head
