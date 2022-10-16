---@mod ofirkai.tablines.bufferline
local M = {}

local scheme = require('ofirkai').scheme

---Custom highlights for bufferline.nvim
---@usage [[
---require('bufferline').setup {
---	highlights = require('ofirkai.tablines.bufferline').highlights, -- Must
---}
---@usage ]]
M.highlights = {
	buffer_visible = {
		fg = scheme.tab_visible_fg,
	},
	numbers_visible = {
		fg = scheme.tab_visible_fg,
	},
	buffer_selected = {
		bold = true,
		italic = false,
	},
	numbers_selected = {
		bold = true,
		italic = false,
	},
	tab_selected = {
		fg = scheme.white,
		bold = true,
	},
}

return M
