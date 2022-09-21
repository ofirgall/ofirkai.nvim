# ofirkai.nvim
Monokai theme for [Neovim](https://github.com/neovim/neovim) with [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) support, aimed to feel like SublimeText 4.

TODO: main screenshot

## Opinionated
TODO:

## Installation
```lua
use 'ofirgall/monokai.nvim'
```

## Usage
```lua
-- Leave empty for default values
require('ofirkai').setup {
}

-- Or setup with custom parameters
require('ofirkai').setup {
	scheme = require('ofirkai').scheme -- Option to override scheme
	custom_hlgroups = {},              -- Option to add/override highlight groups
}
```

_**Note**_: Each plugin that need a setup has an example in the collapsible section.

## Plugin Support
### Status Lines
* https://github.com/nvim-lualine/lualine.nvim
### Tab Lines
* https://github.com/akinsho/bufferline.nvim
TODO: Complete this (with screenshot + setup for each plugin)
### Others
* https://github.com/kyazdani42/nvim-tree.lua
* https://github.com/nvim-telescope/telescope.nvim
* https://github.com/hrsh7th/nvim-cmp
* https://github.com/ray-x/lsp_signature.nvim (not really)
* https://github.com/sindrets/diffview.nvim
* https://github.com/lewis6991/gitsigns.nvim
* https://github.com/nvim-treesitter/nvim-treesitter-context

## Contributing
Pull requests are welcome, you must provide a screenshot of before/after the change.
