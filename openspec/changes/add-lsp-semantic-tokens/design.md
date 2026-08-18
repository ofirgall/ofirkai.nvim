## Context

Ofirkai is a Monokai-inspired Neovim colorscheme. It currently defines ~300 highlight groups covering base vim, treesitter captures (`@function`, `@variable`, etc.), and plugin-specific groups. All highlights live in a single `hl_groups()` function in `lua/ofirkai/design.lua` that returns a flat table keyed by group name.

The `dark_blue` theme variant in `lua/ofirkai/themes/dark_blue.lua` overrides scheme colors and adds a few theme-specific highlight groups.

Neovim 0.9+ introduced LSP semantic token highlighting via `@lsp.type.*`, `@lsp.mod.*`, and `@lsp.typemod.*` highlight groups. Without explicit definitions, Neovim falls back `@lsp.type.<X>` → `@<X>`, which works for some tokens but produces wrong results for others (notably `@lsp.type.variable` → `Identifier` stomps treesitter granularity).

Four reference colorschemes were analyzed:
- **Catppuccin**: 4 groups (ultra-minimal, trusts fallback)
- **Kanagawa**: 25 groups (moderate + Rust/Python extras)
- **Nightfox**: 26 groups (comprehensive type mapping)
- **Tokyonight**: 34 groups (most comprehensive)

## Goals / Non-Goals

**Goals:**
- Theme all LSP semantic tokens consistently with ofirkai's Monokai palette
- Prevent LSP from overriding treesitter's granular variable highlighting
- Support language-specific tokens for Rust and Python
- Keep interface types visually distinct from regular types
- Work correctly with both default and dark_blue themes

**Non-Goals:**
- Adding a configuration option to disable semantic tokens (users can do this via `vim.lsp.semantic_tokens`)
- Supporting per-language-server token customization
- Adding semantic token groups for languages beyond Rust and Python

## Decisions

### 1. Hybrid Tokyonight + Kanagawa approach
**Decision**: Use Tokyonight's comprehensive `@lsp.type.*` mapping as the base, augmented with Kanagawa's language-specific extras.

**Rationale**: Tokyonight's explicit-over-implicit approach is more resilient to future Neovim changes than Catppuccin's minimalism. Kanagawa adds practical value for Rust (`lifetime`, `controlFlow`, `decorator.rust`) and Python (`selfParameter`, `magicFunction`) that Tokyonight doesn't cover.

**Alternatives considered**:
- Catppuccin-minimal (4 groups): Too fragile — depends on Neovim fallback behavior staying stable
- Nightfox-only: Missing language-specific tokens that Kanagawa provides
- Tokyonight-only: Missing `@lsp.mod.readonly`, Rust `controlFlow`/`function.readonly`, Python `magicFunction`/`builtinConstant`

### 2. `@lsp.type.variable = {}` (clear it)
**Decision**: Set to empty table to prevent LSP from overriding treesitter.

**Rationale**: All 4 reference schemes agree. Without this, LSP paints every variable with `Identifier` fg, losing treesitter's distinction between `@parameter` (orange italic), `@property` (white), `@field` (white), and `@variable.builtin` (orange).

### 3. `@lsp.type.interface` → new `light_green` scheme color
**Decision**: Add `light_green` to the scheme (~14% brighter than `green` in HSL lightness) and use it with italic for interface types.

**Rationale**: Interfaces are types, so they belong in the green family. But a distinct shade lets users visually differentiate `interface Foo` from `struct Foo` / `type Foo`. Named `light_green` (not `interface_green`) so the color remains reusable.

**Values**:
- Default: `#b8eb4a` (green `#a6e22e`, L 53% → 61%)
- Dark blue: `#ade440` (green `#9eda26`, L 50% → 57%)

### 4. `@lsp.type.enumMember` → `Constant`
**Decision**: Link to `Constant` (dark_pink).

**Rationale**: 3 of 4 reference schemes use `Constant`. Enum members are semantically constants. This is one of the highest-value semantic tokens since treesitter often cannot detect enum members.

### 5. All groups inline in `hl_groups()` — no separate file
**Decision**: Add all `@lsp` groups directly in the `hl_groups()` return table in `design.lua`, grouped in a commented section.

**Rationale**: Ofirkai's architecture is a single flat table. Adding a separate module would be inconsistent with the existing pattern. A comment section header (`----- LSP Semantic Tokens -----`) matches the existing style (`----- Additional hl groups -----`).

**Alternatives considered**:
- Separate `lua/ofirkai/lsp.lua` file: Would break the single-table pattern and require merging in `init.lua`

## Risks / Trade-offs

- **[Risk] LSP servers may emit tokens not covered** → Neovim's automatic `@lsp.type.X → @X` fallback still works for unmapped tokens. The explicit mappings are a superset, not a replacement.
- **[Risk] Future Neovim versions may change semantic token behavior** → Explicit mappings are more resilient than relying on fallback. Worst case, a mapping becomes redundant (not broken).
- **[Trade-off] ~50 new highlight groups increases maintenance surface** → Mitigated by the fact that almost all are simple links to existing treesitter groups. Only `@lsp.type.interface`, `@lsp.type.unresolvedReference`, and `@lsp.typemod.function.readonly` define custom colors.
