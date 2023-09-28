---@mod ofirkai.tablines.bufferline
local M = {}

local scheme = require('ofirkai').scheme

---Custom highlights for bufferline.nvim
---@type table
---@usage [[
---require('bufferline').setup {
---	highlights = require('ofirkai.tablines.bufferline').highlights, -- Must
---}
---@usage ]]
M.highlights = {
	background = {
		bg = scheme.buffer_line.bg,
		fg = scheme.buffer_line.fg,
	},
	buffer = {
		bg = scheme.buffer_line.bg,
		fg = scheme.buffer_line.fg,
	},
	buffer_selected = {
		bg = scheme.buffer_line.selected_bg,
		fg = scheme.buffer_line.selected_fg,
	},
	buffer_visible = {
		bg = scheme.buffer_line.visible_bg,
		fg = scheme.buffer_line.visible_fg,
	},
	close_button = {
		bg = scheme.buffer_line.bg,
		fg = scheme.buffer_line.fg,
	},
	close_button_selected = {
		bg = scheme.buffer_line.selected_bg,
		fg = scheme.buffer_line.selected_fg,
	},
	close_button_visible = {
		bg = scheme.buffer_line.visible_bg,
		fg = scheme.buffer_line.fg,
	},
	diagnostic = {
		bg = scheme.buffer_line.bg,
	},
	diagnostic_selected = {
		bg = scheme.buffer_line.selected_bg,
	},
	diagnostic_visible = {
		bg = scheme.buffer_line.visible_bg,
	},
	duplicate = {
		bg = scheme.buffer_line.bg,
	},
	duplicate_selected = {
		bg = scheme.buffer_line.selected_bg,
	},
	duplicate_visible = {
		bg = scheme.buffer_line.visible_bg,
	},
	error = {
		bg = scheme.buffer_line.bg,
		fg = scheme.buffer_line.fg,
	},
	error_diagnostic = {
		bg = scheme.buffer_line.bg,
	},
	error_diagnostic_selected = {
		bg = scheme.buffer_line.selected_bg,
	},
	error_diagnostic_visible = {
		bg = scheme.buffer_line.visible_bg,
	},
	error_selected = {
		bg = scheme.buffer_line.selected_bg,
	},
	error_visible = {
		bg = scheme.buffer_line.visible_bg,
		fg = scheme.buffer_line.fg,
	},
	fill = {
		bg = scheme.background,
		fg = scheme.buffer_line.fg,
	},
	group_label = {
		bg = scheme.buffer_line.fg,
		fg = scheme.background,
	},
	group_separator = {
		bg = scheme.background,
		fg = scheme.buffer_line.fg,
	},
	hint = {
		bg = scheme.buffer_line.bg,
		fg = scheme.buffer_line.fg,
	},
	hint_diagnostic = {
		bg = scheme.buffer_line.bg,
	},
	hint_diagnostic_selected = {
		bg = scheme.buffer_line.selected_bg,
	},
	hint_diagnostic_visible = {
		bg = scheme.buffer_line.visible_bg,
	},
	hint_selected = {
		bg = scheme.buffer_line.selected_bg,
	},
	hint_visible = {
		bg = scheme.buffer_line.visible_bg,
		fg = scheme.buffer_line.fg,
	},
	indicator_selected = {
		bg = scheme.buffer_line.selected_bg,
	},
	indicator_visible = {
		bg = scheme.buffer_line.visible_bg,
		fg = scheme.buffer_line.visible_bg,
	},
	info = {
		bg = scheme.buffer_line.bg,
		fg = scheme.buffer_line.fg,
	},
	info_diagnostic = {
		bg = scheme.buffer_line.bg,
	},
	info_diagnostic_selected = {
		bg = scheme.buffer_line.selected_bg,
	},
	info_diagnostic_visible = {
		bg = scheme.buffer_line.visible_bg,
	},
	info_selected = {
		bg = scheme.buffer_line.selected_bg,
	},
	info_visible = {
		bg = scheme.buffer_line.visible_bg,
		fg = scheme.buffer_line.fg,
	},
	modified = {
		bg = scheme.buffer_line.bg,
	},
	modified_selected = {
		bg = scheme.buffer_line.selected_bg,
	},
	modified_visible = {
		bg = scheme.buffer_line.visible_bg,
	},
	numbers = {
		bg = scheme.buffer_line.bg,
		fg = scheme.buffer_line.fg,
	},
	numbers_selected = {
		bg = scheme.buffer_line.selected_bg,
		fg = scheme.buffer_line.selected_fg,
	},
	numbers_visible = {
		bg = scheme.buffer_line.visible_bg,
		fg = scheme.buffer_line.visible_fg,
	},
	offset_separator = {
		bg = scheme.background,
	},
	pick = {
		bg = scheme.buffer_line.bg,
	},
	pick_selected = {
		bg = scheme.buffer_line.selected_bg,
	},
	pick_visible = {
		bg = scheme.buffer_line.visible_bg,
	},
	separator = {
		bg = scheme.buffer_line.bg,
		fg = scheme.background,
	},
	separator_selected = {
		bg = scheme.buffer_line.selected_bg,
		fg = scheme.background,
	},
	separator_visible = {
		bg = scheme.buffer_line.visible_bg,
		fg = scheme.background,
	},
	tab = {
		bg = scheme.buffer_line.bg,
		fg = scheme.buffer_line.fg,
	},
	tab_close = {
		bg = scheme.buffer_line.bg,
		fg = scheme.buffer_line.fg,
	},
	tab_selected = {
		bg = scheme.buffer_line.selected_bg,
		fg = scheme.buffer_line.selected_fg,
	},
	tab_separator = {
		bg = scheme.buffer_line.bg,
		fg = scheme.background,
	},
	tab_separator_selected = {
		bg = scheme.buffer_line.selected_bg,
		fg = scheme.background,
	},
	trunc_marker = {
		bg = scheme.background,
		fg = scheme.buffer_line.fg,
	},
	warning = {
		bg = scheme.buffer_line.bg,
		fg = scheme.buffer_line.fg,
	},
	warning_diagnostic = {
		bg = scheme.buffer_line.bg,
	},
	warning_diagnostic_selected = {
		bg = scheme.buffer_line.selected_bg,
	},
	warning_diagnostic_visible = {
		bg = scheme.buffer_line.visible_bg,
	},
	warning_selected = {
		bg = scheme.buffer_line.selected_bg,
	},
	warning_visible = {
		bg = scheme.buffer_line.visible_bg,
		fg = scheme.buffer_line.fg,
	},
}

return M
