---@mod ofirkai Introduction
---@brief [[
---Monokai theme
---@brief ]]
---@divider -
local M = {}

local design = require('ofirkai.design')

local function highlight(group, color)
	local style = color.style and 'gui=' .. color.style or 'gui=NONE'
	local fg = color.fg and 'guifg = ' .. color.fg or 'guifg = NONE'
	local bg = color.bg and 'guibg = ' .. color.bg or 'guibg = NONE'
	local sp = color.sp and 'guisp = ' .. color.sp or ''
	vim.cmd(
		'highlight ' .. group .. ' ' .. style .. ' ' .. fg .. ' ' .. bg .. ' ' .. sp
	)
end

local function filter_hl_groups(config, hl_groups)
	for _, colors in pairs(hl_groups) do
		if config.remove_italics then
			if colors.italic then
				colors.italic = false
			end
		end
	end

	return hl_groups
end

local default_config = {
	scheme = require('ofirkai.schemes').default,
	custom_hlgroups = {},
	remove_italics = false,
}

---@param config table user config
---@usage [[
-----Leave empty for default values
---require('ofirkai').setup {
---}
---
----- Or setup with custom parameters
---require('ofirkai').setup {
--- -- Option to override scheme with a table
-- TODO: doc
---	scheme = require('ofirkai').scheme
---	custom_hlgroups = {},              -- Option to add/override highlight groups
---	remove_italics = false,            -- Option to change all the italics style to none
---}
---@usage ]]
M.setup = function(config)
	vim.cmd('hi clear')
	if vim.fn.exists('syntax_on') then
		vim.cmd('syntax reset')
	end
	vim.o.background = 'dark'
	vim.o.termguicolors = true
	vim.g.colors_name = 'ofirkai'

	config = config or {}
	config = vim.tbl_deep_extend('keep', config, default_config)
	for color, alias in pairs(config.scheme) do
		if alias:sub(1, 1) ~= '#' then
			print(alias)
			config.scheme[color] = config.scheme[alias]
			print(color, config.scheme[color], config.scheme[alias])
		end
	end

	local hl_groups = design.hl_groups(config.scheme)
	hl_groups = vim.tbl_deep_extend('keep', config.custom_hlgroups, hl_groups)

	hl_groups = filter_hl_groups(config, hl_groups)

	for group, colors in pairs(hl_groups) do
		if colors.ctermfg then
			highlight(group, colors)
		else
			vim.api.nvim_set_hl(0, group, colors)
		end
	end
end

---Alias for require('ofirkai.schemes').default
---@type table
M.scheme = require('ofirkai.schemes').default

return M
