---@mod ofirkai.statuslines.lualine
local M = {}

local scheme = require('ofirkai').scheme

local colors = {
	a_fg = '#434343',
	b_bg = '#45453b',
	c_bg = '#33332a',

	normal = '#de933c',
	insert = '#a0bfdf',
	visual = '#feacd0',
	replace = '#ffa0a0',
	command = '#88cf88',

	inactive = '#202020',
}

---Lualine theme
---@type table
---@usage [[
---require('lualine').setup {
---	options = {
---		theme = require('ofirkai.statuslines.lualine').theme,
---	}
---}
---@usage ]]
M.theme = {
	normal = {
		a = { bg = colors.normal, fg = colors.a_fg, gui = 'bold' },
		b = { bg = colors.lightbrown, fg = colors.normal },
		c = { bg = colors.c_bg, fg = colors.normal },
		x = { bg = colors.c_bg, fg = colors.normal },
	},
	insert = {
		a = { bg = colors.insert, fg = colors.a_fg, gui = 'bold' },
		b = { bg = colors.lightbrown, fg = colors.insert },
		c = { bg = colors.c_bg, fg = colors.insert },
		x = { bg = colors.c_bg, fg = colors.insert },
	},
	visual = {
		a = { bg = colors.visual, fg = colors.a_fg, gui = 'bold' },
		b = { bg = colors.lightbrown, fg = colors.visual },
		c = { bg = colors.c_bg, fg = colors.visual },
		x = { bg = colors.c_bg, fg = colors.visual },
	},
	replace = {
		a = { bg = colors.replace, fg = colors.a_fg, gui = 'bold' },
		b = { bg = colors.lightbrown, fg = colors.replace },
		c = { bg = colors.c_bg, fg = colors.replace },
		x = { bg = colors.c_bg, fg = colors.replace },
	},
	command = {
		a = { bg = colors.command, fg = colors.a_fg, gui = 'bold' },
		b = { bg = colors.lightbrown, fg = colors.command },
		c = { bg = colors.c_bg, fg = colors.command },
		x = { bg = colors.c_bg, fg = colors.command },
	},
	inactive = {
		a = { bg = colors.inactive, fg = colors.a_fg, gui = 'bold' },
		b = { bg = colors.inactive, fg = colors.a_fg },
		c = { bg = colors.inactive, fg = colors.a_fg, gui = 'bold' },
		x = { bg = colors.inactive, fg = colors.a_fg },
	},
}

---Winbar color (for each section), see README for usage
---@type table
M.winbar_color = {
	fg = scheme.lightorange,
	bg = scheme.winbar_bg,
	gui = 'bold',
}

return M
