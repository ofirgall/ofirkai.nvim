local M = {}

local scheme = require('ofirkay').scheme

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
