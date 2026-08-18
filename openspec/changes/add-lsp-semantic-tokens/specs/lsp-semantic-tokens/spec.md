## ADDED Requirements

### Requirement: Clear @lsp.type.variable to preserve treesitter granularity
The colorscheme SHALL set `@lsp.type.variable` to an empty table `{}` so that LSP does not override treesitter's more specific variable highlights (`@parameter`, `@property`, `@field`).

#### Scenario: Variable highlighting defers to treesitter
- **WHEN** an LSP server emits a `variable` semantic token for a function parameter
- **THEN** the highlight remains the treesitter `@parameter` style (orange italic) rather than a generic `Identifier` color

### Requirement: Core @lsp.type.* mappings to treesitter captures
The colorscheme SHALL define explicit `@lsp.type.*` highlight groups that link to their corresponding treesitter capture groups. The following mappings SHALL be defined:

| LSP token type       | Links to              |
|----------------------|-----------------------|
| `parameter`          | `@parameter`          |
| `property`           | `@property`           |
| `method`             | `@method`             |
| `macro`              | `Macro`               |
| `keyword`            | `@keyword`            |
| `comment`            | `@comment`            |
| `string`             | `@string`             |
| `number`             | `@number`             |
| `boolean`            | `@boolean`            |
| `operator`           | `@operator`           |
| `enum`               | `@type`               |
| `enumMember`         | `Constant`            |
| `typeAlias`          | `@type.definition`    |
| `builtinType`        | `@type.builtin`       |
| `generic`            | `@variable`           |
| `namespace`          | `@namespace`          |
| `escapeSequence`     | `@string.escape`      |
| `formatSpecifier`    | `@punctuation.special` |
| `decorator`          | `@attribute`          |
| `deriveHelper`       | `@attribute`          |

#### Scenario: Enum member gets Constant color
- **WHEN** an LSP server emits an `enumMember` semantic token
- **THEN** it SHALL be highlighted with `Constant` style (dark_pink)

#### Scenario: Decorator gets attribute color
- **WHEN** an LSP server emits a `decorator` semantic token (e.g., a Python decorator or Rust derive)
- **THEN** it SHALL be highlighted with `@attribute` style (light_red)

### Requirement: Interface type uses light_green color
The colorscheme SHALL define `@lsp.type.interface` with `fg = scheme.light_green` and `italic = true`. The `light_green` color SHALL be added to the scheme table as ~14% brighter (HSL lightness) than the base `green`.

- Default theme: `light_green = '#b8eb4a'` (base green `#a6e22e`, L 53% → 61%)
- Dark blue theme: `light_green = '#ade440'` (base green `#9eda26`, L 50% → 57%)

#### Scenario: Interface highlighted distinctly from regular type
- **WHEN** an LSP server emits an `interface` semantic token
- **THEN** it SHALL be highlighted in light_green italic, visually brighter than regular `@type` (green italic)

### Requirement: Unresolved reference shown with undercurl
The colorscheme SHALL define `@lsp.type.unresolvedReference` with `undercurl = true` and `sp = scheme.red`.

#### Scenario: Unresolved reference gets error undercurl
- **WHEN** an LSP server emits an `unresolvedReference` semantic token
- **THEN** it SHALL be displayed with a red undercurl

### Requirement: Extra type tokens from Kanagawa
The colorscheme SHALL define these additional `@lsp.type.*` groups:

| LSP token type | Links to    |
|----------------|-------------|
| `const`        | `Constant`  |
| `comparison`   | `Operator`  |
| `bitwise`      | `Operator`  |
| `punctuation`  | `Delimiter` |

#### Scenario: Const token gets Constant highlight
- **WHEN** an LSP server emits a `const` semantic token
- **THEN** it SHALL be highlighted with `Constant` style (dark_pink)

### Requirement: Rust-specific semantic tokens
The colorscheme SHALL define Rust-specific `@lsp.type.*` groups:

| LSP token type   | Links to       |
|-------------------|---------------|
| `lifetime`        | `StorageClass` |
| `decorator.rust`  | `@attribute`   |

#### Scenario: Rust lifetime gets StorageClass color
- **WHEN** a Rust LSP server emits a `lifetime` semantic token (e.g., `'a`)
- **THEN** it SHALL be highlighted with `StorageClass` style (purple italic)

### Requirement: Python-specific semantic tokens
The colorscheme SHALL define Python-specific `@lsp.type.*` groups:

| LSP token type      | Links to            |
|----------------------|---------------------|
| `selfParameter`      | `@variable.builtin` |
| `selfKeyword`        | `@variable.builtin` |
| `selfTypeKeyword`    | `@variable.builtin` |
| `builtinConstant`    | `@constant.builtin` |
| `magicFunction`      | `@function.builtin` |
| `namespace.python`   | `@variable`         |

#### Scenario: Python self highlighted as builtin variable
- **WHEN** a Python LSP server emits a `selfParameter` or `selfKeyword` semantic token
- **THEN** it SHALL be highlighted with `@variable.builtin` style (orange)

#### Scenario: Python namespace treated as variable
- **WHEN** a Python LSP server emits a `namespace` semantic token in a `.py` file
- **THEN** it SHALL be highlighted as `@variable` (white) rather than `@namespace` (purple)

### Requirement: @lsp.mod.readonly modifier
The colorscheme SHALL define `@lsp.mod.readonly` linking to `Constant`.

#### Scenario: Readonly variable gets Constant color
- **WHEN** an LSP server marks a token with the `readonly` modifier
- **THEN** it SHALL be highlighted with `Constant` style (dark_pink)

### Requirement: defaultLibrary/builtin typemod mappings
The colorscheme SHALL define `@lsp.typemod.*` groups for defaultLibrary and builtin modifiers:

| LSP typemod                        | Links to            |
|------------------------------------|---------------------|
| `function.defaultLibrary`          | `@function.builtin` |
| `function.builtin`                 | `@function.builtin` |
| `method.defaultLibrary`            | `@function.builtin` |
| `macro.defaultLibrary`             | `@function.builtin` |
| `class.defaultLibrary`             | `@type.builtin`     |
| `enum.defaultLibrary`              | `@type.builtin`     |
| `struct.defaultLibrary`            | `@type.builtin`     |
| `type.defaultLibrary`              | `@type.builtin`     |
| `enumMember.defaultLibrary`        | `@constant.builtin` |
| `variable.defaultLibrary`          | `@variable.builtin` |

#### Scenario: Standard library function gets builtin color
- **WHEN** an LSP server emits a function token with the `defaultLibrary` modifier (e.g., `print`)
- **THEN** it SHALL be highlighted with `@function.builtin` style (aqua)

### Requirement: Variable modifier typemods
The colorscheme SHALL define variable modifier `@lsp.typemod.*` groups:

| LSP typemod             | Links to     |
|-------------------------|-------------|
| `variable.callable`     | `@function` |
| `variable.static`       | `Constant`  |
| `variable.global`       | `Constant`  |
| `variable.injected`     | `@variable` |

#### Scenario: Callable variable highlighted as function
- **WHEN** an LSP server marks a variable as `callable`
- **THEN** it SHALL be highlighted with `@function` style (aqua)

#### Scenario: Static variable highlighted as constant
- **WHEN** an LSP server marks a variable as `static`
- **THEN** it SHALL be highlighted with `Constant` style (dark_pink)

### Requirement: Keyword modifier typemods
The colorscheme SHALL define keyword modifier `@lsp.typemod.*` groups:

| LSP typemod               | Links to   |
|---------------------------|-----------|
| `keyword.async`           | `@keyword` |
| `keyword.injected`        | `@keyword` |
| `keyword.documentation`   | `Special`  |

#### Scenario: Documentation keyword gets Special color
- **WHEN** an LSP server marks a keyword with the `documentation` modifier (e.g., Rust doc comment keywords)
- **THEN** it SHALL be highlighted with `Special` style (white)

### Requirement: Injected typemods
The colorscheme SHALL define injected `@lsp.typemod.*` groups:

| LSP typemod           | Links to    |
|-----------------------|-----------|
| `operator.injected`   | `@operator` |
| `string.injected`     | `@string`   |

#### Scenario: Injected string preserves string color
- **WHEN** an LSP server marks a string as `injected` (e.g., in a template literal)
- **THEN** it SHALL be highlighted with `@string` style (yellow)

### Requirement: Rust-specific typemods
The colorscheme SHALL define Rust-specific `@lsp.typemod.*` groups:

| LSP typemod                | Target                              |
|----------------------------|--------------------------------------|
| `operator.controlFlow`     | `@exception`                         |
| `function.readonly`        | `{ fg = scheme.aqua, bold = true }`  |

#### Scenario: Rust ? operator gets exception color
- **WHEN** a Rust LSP server emits the `?` operator with `controlFlow` modifier
- **THEN** it SHALL be highlighted with `@exception` style (light_red)

#### Scenario: Rust readonly function gets bold aqua
- **WHEN** a Rust LSP server marks a function as `readonly`
- **THEN** it SHALL be highlighted in aqua with bold styling
