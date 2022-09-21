local M = {}

local scheme = require('ofirkai').scheme

-- customized modus-vivendi
local colors = {
	black      = '#000000',
	white      = scheme.white,
	red        = '#ffa0a0',
	green      = '#88cf88',
	blue       = '#92baff',
	magenta    = '#feacd0',
	cyan       = '#a0bfdf',
	brown      = '#33332a',
	lightbrown = '#404036',
	darkgray   = '#202020',
	lightgray  = '#434343',
	orange     = '#de933c'
}

M.theme = {
	normal = {
		a = { bg = colors.orange, fg = colors.lightgray, gui = 'bold' },
		b = { bg = colors.lightbrown, fg = colors.orange },
		c = { bg = colors.brown, fg = colors.white },
		x = { bg = colors.brown, fg = colors.orange },
	},
	insert = {
		a = { bg = colors.cyan, fg = colors.lightgray, gui = 'bold' },
		b = { bg = colors.lightbrown, fg = colors.cyan },
		c = { bg = colors.brown, fg = colors.white },
		x = { bg = colors.brown, fg = colors.cyan },
	},
	visual = {
		a = { bg = colors.magenta, fg = colors.lightgray, gui = 'bold' },
		b = { bg = colors.lightbrown, fg = colors.magenta },
		c = { bg = colors.brown, fg = colors.white },
		x = { bg = colors.lightbrown, fg = colors.magenta },
	},
	replace = {
		a = { bg = colors.red, fg = colors.lightgray, gui = 'bold' },
		b = { bg = colors.lightbrown, fg = colors.red },
		c = { bg = colors.brown, fg = colors.white },
		x = { bg = colors.lightbrown, fg = colors.red },
	},
	command = {
		a = { bg = colors.green, fg = colors.lightgray, gui = 'bold' },
		b = { bg = colors.lightbrown, fg = colors.green },
		c = { bg = colors.brown, fg = colors.white },
		x = { bg = colors.lightbrown, fg = colors.green },
	},
	inactive = {
		a = { bg = colors.darkgray, fg = colors.lightgray, gui = 'bold' },
		b = { bg = colors.darkgray, fg = colors.lightgray },
		c = { bg = colors.darkgray, fg = colors.lightgray },
		x = { bg = colors.darkgray, fg = colors.lightgray },
	},
}

return M
