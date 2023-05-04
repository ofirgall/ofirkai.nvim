---@mod ofirkai.schemes
local M = {}

---The default theme table
---@type table
M.default = {
	-- Main backgrounds
	background = '#282923',
	secondary_background = '#1d2026',
	ui_bg = '#1a1a18', -- background for ui, file tree and such.
	telescope_bg = '#181816', -- Slightly darker than ui_bg
	winbar_bg = '#222219',
	-- Base colors
	white = '#f8f8f0',
	grey = '#8F908A',
	black = '#000000',
	green = '#a6e22e',
	aqua = '#66d9ef',
	dimmed_aqua = '#4a7d87',
	yellow = '#e6db74',
	orange = '#fd971f',
	purple = '#ae81ff',
	red = '#e95678',
	light_red = '#f92672',
	dark_pink = '#e878d2',
	teal = '#3ae0b4',
	dark_yellow = '#ffd121',
	dark_teal = '#26cca0',
	-- Specific colors
	whitespace_fg = '#333842',
	non_text_fg = '#4d5154',
	comment_fg = '#9ca0a4',
	unnecessary_fg = '#a0a0a0',
	highlighted_word_bg = '#343942',
	tab_visible_fg = '#b3ab60',
	cursor_line_bg = '#36352a',
	mid_orange = '#de933c',
	lightorange = '#dea255',
	telescope_prompt = '#1d1d1a',
	diff_add = '#3d5213',
	diff_remove = '#4a0f23',
	diff_change = '#27406b',
	diff_text = '#23324d',
	visual_bg = '#46453a',
	search_bg = '#424137',
	pmenu_bg = '#2c2c26',
	pmenu_sel_bg = '#40403a',
	pmenu_thumb_bg = '#47473b',
	vert_split_fg = '#75724b',
	vert_split_fg_active = '#948f5a', -- TODO: add nvim-zh/colorful-winsep.nvim support
	tabline_fg = '#f20aee',
	tabline_sel_fg = '#78b6e8',
	-- Plugins colors
	nvim_cmp_fuzzy_fg = '#34d8f7',
	git_signs_add = '#6a921a',
	git_signs_change = '#0e72cf',
}

M.vscode = {
	-- Main backgrounds
	background = '#1e1e1e',
	secondary_background = '#1d2026',
	ui_bg = '#1a1a18', -- background for ui, file tree and such.
	telescope_bg = '#181816', -- Slightly darker than ui_bg
	winbar_bg = '#222219',
	-- Base colors
	white = '#d4d4d4',
	grey = '#8F908A',
	black = '#000000',
	green = '#a6e22e',
	aqua = '#66d9ef',
	dimmed_aqua = '#4a7d87',
	yellow = '#e6db74',
	orange = '#fd971f',
	purple = '#ae81ff',
	red = '#e95678',
	light_red = '#f92672',
	dark_pink = '#e878d2',
	teal = '#3ae0b4',
	dark_yellow = '#ffd121',
	dark_teal = '#26cca0',
	-- Specific colors
	whitespace_fg = '#333842',
	non_text_fg = '#4d5154',
	comment_fg = '#9ca0a4',
	unnecessary_fg = '#a0a0a0',
	highlighted_word_bg = '#343942',
	tab_visible_fg = '#b3ab60',
	cursor_line_bg = '#36352a',
	mid_orange = '#de933c',
	lightorange = '#dea255',
	telescope_prompt = '#1d1d1a',
	diff_add = '#3d5213',
	diff_remove = '#4a0f23',
	diff_change = '#27406b',
	diff_text = '#23324d',
	visual_bg = '#46453a',
	search_bg = '#424137',
	pmenu_bg = '#2c2c26',
	pmenu_sel_bg = '#40403a',
	pmenu_thumb_bg = '#47473b',
	vert_split_fg = '#75724b',
	vert_split_fg_active = '#948f5a', -- TODO: add nvim-zh/colorful-winsep.nvim support
	tabline_fg = '#f20aee',
	tabline_sel_fg = '#78b6e8',
	-- Plugins colors
	nvim_cmp_fuzzy_fg = '#34d8f7',
	git_signs_add = '#6a921a',
	git_signs_change = '#0e72cf',

	match_paren = 'visual_bg'
}

M.darcula = {
	-- Main backgrounds
	background = '#2f3032',
	secondary_background = '#333436',
	ui_bg = '#1a1a18', -- background for ui, file tree and such.
	telescope_bg = '#181816', -- Slightly darker than ui_bg
	winbar_bg = '#222219',
	-- Base colors
	white = '#f8f8f0',
	grey = '#8F908A',
	black = '#000000',
	green = '#a6e22e',
	aqua = '#66d9ef',
	dimmed_aqua = '#4a7d87',
	yellow = '#e6db74',
	orange = '#fd971f',
	purple = '#ae81ff',
	red = '#e95678',
	light_red = '#f92672',
	dark_pink = '#e878d2',
	teal = '#3ae0b4',
	dark_yellow = '#ffd121',
	dark_teal = '#26cca0',
	-- Specific colors
	whitespace_fg = '#333842',
	non_text_fg = '#4d5154',
	comment_fg = '#9ca0a4',
	unnecessary_fg = '#a0a0a0',
	highlighted_word_bg = '#343942',
	tab_visible_fg = '#b3ab60',
	cursor_line_bg = '#36352a',
	mid_orange = '#de933c',
	lightorange = '#dea255',
	telescope_prompt = '#1d1d1a',
	diff_add = '#3d5213',
	diff_remove = '#4a0f23',
	diff_change = '#27406b',
	diff_text = '#23324d',
	visual_bg = '#2D384C',
	search_bg = '#424137',
	pmenu_bg = '#2c2c26',
	pmenu_sel_bg = '#40403a',
	pmenu_thumb_bg = '#47473b',
	vert_split_fg = '#75724b',
	vert_split_fg_active = '#948f5a', -- TODO: add nvim-zh/colorful-winsep.nvim support
	tabline_fg = '#f20aee',
	tabline_sel_fg = '#78b6e8',
	-- Plugins colors
	nvim_cmp_fuzzy_fg = '#34d8f7',
	git_signs_add = '#6a921a',
	git_signs_change = '#0e72cf',

	match_paren = 'visual_bg'
}

return M
