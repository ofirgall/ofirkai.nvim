## Why

Ofirkai has comprehensive treesitter highlight groups but no LSP semantic token groups (`@lsp.type.*`, `@lsp.mod.*`, `@lsp.typemod.*`). Without them, LSP semantic highlights either fall back to Neovim defaults (which can clash with the Monokai palette) or stomp over treesitter's granular distinctions — most notably, `@lsp.type.variable` painting every variable with generic `Identifier` colors instead of letting treesitter differentiate parameters, fields, and properties.

## What Changes

- Add `light_green` color to the default scheme (~14% brighter than `green`) for interface types
- Add `light_green` override to the `dark_blue` theme
- Add ~50 `@lsp` highlight groups to `hl_groups()` covering:
  - Core `@lsp.type.*` mappings to existing treesitter captures (comprehensive, Tokyonight-style)
  - `@lsp.mod.*` modifiers (e.g., `readonly`)
  - `@lsp.typemod.*` compound modifiers (defaultLibrary, builtin, injected, callable, static, global)
  - Rust-specific tokens: `lifetime`, `decorator.rust`, `operator.controlFlow`, `function.readonly`
  - Python-specific tokens: `selfParameter`, `selfKeyword`, `builtinConstant`, `magicFunction`, `namespace.python`
  - Extra Kanagawa-sourced tokens: `const`, `comparison`, `bitwise`, `punctuation`

## Capabilities

### New Capabilities
- `lsp-semantic-tokens`: LSP semantic token highlight group definitions for `@lsp.type.*`, `@lsp.mod.*`, and `@lsp.typemod.*`

### Modified Capabilities
(none)

## Impact

- `lua/ofirkai/design.lua` — new scheme color + new highlight groups in `hl_groups()`
- `lua/ofirkai/themes/dark_blue.lua` — `light_green` color override
- Users with LSP servers that emit semantic tokens will see themed highlighting instead of Neovim defaults
- No breaking changes — all additions are new highlight groups
