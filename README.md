# ofirkai.nvim
Monokai theme for [Neovim](https://github.com/neovim/neovim) with [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) support, aimed to feel like SublimeText 4.

---
* [Installation](#installation)
	* [Usage](#usage)
* [Supported Plugins](#supported-plugins)
	* [Status Lines](#status-lines)
	* [Tab Lines](#tab-lines)
	* [Others](#others)
* [Contributing](#contributing)
---

<p align='center'><a><img src='./media/main.png'></a></p>

## Why not [monokai.nvim](https://github.com/tanvirtin/monokai.nvim)?
Before I used Neovim I used Sublime Text for 6 years with the builtin Monokai scheme.

The first thing I did when I transferred to Neovim was searching a Monokai colorscheme, my eyes got used to the colorscheme and I didn't want to change what I used to.

I found [monokai.nvim](https://github.com/tanvirtin/monokai.nvim) and installed it immediately, unfortunately it wasn't 1:1 to Sublime Text, I tinkered some values through the config and achieved a colorscheme I was happy with.

I kept adding support for other plugins and changing the default values of [monokai.nvim](https://github.com/tanvirtin/monokai.nvim). A colleague of mine asked which colorscheme I use and how can he install it, I answered it was my customized monokai colorscheme, hence the name ofirkay.


## Installation
```lua
use 'ofirgall/monokai.nvim'
```

### Usage
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

You can find the default values for the scheme and highlights in [design.lua](https://github.com/ofirgall/ofirkai.nvim/blob/master/lua/ofirkai/design.lua).

_**Note**_: Each plugin that need a setup has an example in the collapsible section.

## Supported Plugins
There is a screenshot example for each plugin.

### Status Lines
<details><summary><a href='https://github.com/nvim-lualine/lualine.nvim'>lualine.nvim</a> - <b>Custom Setup Required</b></summary>

---
<p align='center'><a><img src='./media/lualine/lualine_normal.png'></a></p>
<p align='center'><a><img src='./media/lualine/lualine_insert.png'></a></p>
<p align='center'><a><img src='./media/lualine/lualine_visual.png'></a></p>
<p align='center'><a><img src='./media/lualine/lualine_command.png'></a></p>

**Setup Example:**
```lua
require('lualine').setup {
	options = {
		theme = require('ofirkai.statuslines.lualine').theme,
	}
}
```
---
</details>

### Tab Lines
<details><summary><a href='https://github.com/akinsho/bufferline.nvim'>bufferline.nvim</a> - <b>Custom Setup Required</b></summary>

---
<p align='center'><a><img src='./media/bufferline.png'></a></p>

Setup Example:
```lua
-- bufferline.nvim, must be loaded after color scheme (working on that https://github.com/ofirgall/ofirkai.nvim/issues/2)
require('bufferline').setup {
	highlights = require('ofirkai.tablines.bufferline').highlights, -- Must
	options = { -- Optional, recommended
		themable = true, -- Must
		separator_style = 'slant',
		offsets = { { filetype = 'NvimTree', text = 'File Explorer', text_align = 'center' } },
		show_buffer_icons = true,
		numbers = 'ordinal',
		max_name_length = 40,
	},
}
```
---
</details>

### Others
<details><summary><a href='https://github.com/hrsh7th/nvim-cmp'>nvim-cmp</a> - <b>Custom Setup is Optional</b></summary>

---
<p align='center'><a><img src='./media/nvim-cmp.png'></a></p>

```lua
require('cmp').setup({
	window = require('ofirkai.plugins.nvim-cmp').window, -- I just removed the `FloatBorder:Normal` from the highlights to allow the FloatBorder to be colored, its not a must.

	-- Get lsp icons from ofirkai, requires https://github.com/onsails/lspkind.nvim
	formatting = {
		format = lspkind.cmp_format({
			symbol_map = require('ofirkai.plugins.nvim-cmp').kind_icons,
			maxwidth = 50,
			mode = 'symbol'
		})
	},

})
```
---
</details>

<details><summary><a href='https://github.com/kyazdani42/nvim-tree.lua'>nvim-tree.lua</a></summary>

---
<p align='center'><a><img src='./media/nvim-tree.png'></a></p>

---
</details>

<details><summary><a href='https://github.com/nvim-telescope/telescope.nvim'>telescope.nvim</a></summary>

---
<p align='center'><a><img src='./media/telescope.png'></a></p>

---
</details>

<details><summary><a href='https://github.com/sindrets/diffview.nvim'>diffview.nvim</a></summary>

---
<p align='center'><a><img src='./media/diffview.png'></a></p>

---
</details>

<details><summary><a href='https://github.com/lewis6991/gitsigns.nvim'>gitsigns.nvim</a></summary>

---
<p align='center'><a><img src='./media/gitsigns.png'></a></p>

---
</details>

<details><summary><a href='https://github.com/nvim-treesitter/nvim-treesitter-context'>nvim-treesitter-context</a></summary>

---
<p align='center'><a><img src='./media/treesitter-context.png'></a></p>

---
</details>


<details><summary><a href='https://github.com/ray-x/lsp_signature.nvim'>lsp_signature.nvim</a></summary>

---
I don't change the highlight group because I use a minmilistastic desing for the lsp signature you can adapt it.

<p align='center'><a><img src='./media/lsp_signature.png'></a></p>

```lua
local lsp_signature_cfg = {
	bind = true,
	use_lspsaga = false,
	doc_lines = 0,
	floating_window = false,
	hint_scheme = 'LspSignatureHintVirtualText',
	hint_prefix = ' ',
}
```
---
</details>

<details><summary><a href='https://github.com/o0th/tmux-nova/blob/master/Gallery.md#gruvbox'>tmux status bar</a></summary>

---
<p align='center'><a><img src='./media/tmux.png'></a></p>

---
</details>

## Contributing
Pull requests are welcome, you must provide a screenshot of before/after the change.
