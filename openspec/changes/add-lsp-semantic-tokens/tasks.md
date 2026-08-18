## 1. Scheme Colors

- [x] 1.1 Add `light_green = '#b8eb4a'` to `M.scheme` in `lua/ofirkai/design.lua` with comment `-- ~14% brighter than green, for LSP interface types`
- [x] 1.2 Add `light_green = '#ade440'` to `M.scheme` in `lua/ofirkai/themes/dark_blue.lua` with comment `-- ~14% brighter than green, for LSP interface types`

## 2. LSP Semantic Token Highlight Groups

- [x] 2.1 Add `@lsp.type.*` core type mappings to `hl_groups()` in `design.lua` — variable (cleared), parameter, property, method, macro, keyword, comment, string, number, boolean, operator, enum, enumMember, interface, typeAlias, builtinType, generic, namespace, escapeSequence, formatSpecifier, decorator, deriveHelper, unresolvedReference
- [x] 2.2 Add `@lsp.type.*` Kanagawa extras — const, comparison, bitwise, punctuation
- [x] 2.3 Add `@lsp.type.*` Rust-specific — lifetime, decorator.rust
- [x] 2.4 Add `@lsp.type.*` Python-specific — selfParameter, selfKeyword, selfTypeKeyword, builtinConstant, magicFunction, namespace.python
- [x] 2.5 Add `@lsp.mod.readonly` → `Constant`
- [x] 2.6 Add `@lsp.typemod.*` defaultLibrary/builtin groups — function.defaultLibrary, function.builtin, method.defaultLibrary, macro.defaultLibrary, class.defaultLibrary, enum.defaultLibrary, struct.defaultLibrary, type.defaultLibrary, enumMember.defaultLibrary, variable.defaultLibrary
- [x] 2.7 Add `@lsp.typemod.*` variable modifiers — variable.callable, variable.static, variable.global, variable.injected
- [x] 2.8 Add `@lsp.typemod.*` keyword modifiers — keyword.async, keyword.injected, keyword.documentation
- [x] 2.9 Add `@lsp.typemod.*` injected groups — operator.injected, string.injected
- [x] 2.10 Add `@lsp.typemod.*` Rust-specific — operator.controlFlow, function.readonly
