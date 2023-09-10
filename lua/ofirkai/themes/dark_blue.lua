local M = {}

-- brown
local float_color = '#131426'
local telescope_preview_border = '#12131b'

M.scheme = {
	-- midnight.nvim
	background = '#080c10',
	telescope_prompt = float_color,
	telescope_bg = '#0f1018',

	-- cursor_line_bg = '#1f2325',
	cursor_line_bg = '#1b1f21',
	winbar_bg = '#171b1d',
	white = '#edede5',
	-- visual_bg = '#30303c',
	visual_bg = '#14364e',
	search_bg = '#14364e',
	inc_search_bg = '#652d67',
	inc_search_fg = '#edede5', -- same as white

	-- syntax
	aqua = '#58cbe1',
	orange = '#f8921a',
	green = '#9eda26',
	yellow = '#e1d66f',
	light_red = '#e5125e',
	purple = '#a97cfa',
	dark_pink = '#e373cd',
	dark_yellow = '#fbcd1d',

	-- ui
	sidebar_bg = '#131A24',
	ui_bg = '#131426',
	ui_title_fg = '#e373cd',

	vert_split_fg = '#7b7b7b',
	vert_split_fg_active = '#888888',
	git_signs_add = '#567e06',
	git_signs_change = '#0063c0',
	tab_visible_fg = '#944770',

	-- darker diff colors
	diff_add = '#293e04',
	diff_remove = '#400519',
	diff_change = '#182c57',
	diff_text = '#14233e',
}

M.hl_groups = function(scheme)
	return {
		LineNr = {
			fg = '#7a7a7a',
		},
		CursorLineNr = {
			fg = '#e0e0e0',
		},

		-- TODO: ????
		TelescopePreviewBorder = {
			fg = telescope_preview_border,
			bg = telescope_preview_border,
		},

		-- Swapped noice
		NoiceCmdLine = {
			bg = scheme.background,
		},
		NoiceBorder = {
			fg = scheme.ui_bg,
			bg = scheme.ui_bg,
		},
		NoiceFormatTitle = {
			bg = scheme.ui_bg,
			fg = scheme.ui_bg,
		},
		NoiceCmdlinePopup = { -- Actual search line
			link = 'NoiceCmdLine',
		},
		NoiceCmdlinePopupBorder = {
			link = 'NoiceBorder',
		},
		NoiceCmdlinePopupBorderCmdline = {
			link = 'NoiceBorder',
		},
		NoiceCmdlinePopupBorderFilter = {
			link = 'NoiceBorder',
		},
		NoiceCmdlinePopupBorderLua = {
			link = 'NoiceBorder',
		},
		NoiceCmdlinePopupBorderSearch = {
			link = 'NoiceBorder',
		},
	}
end

return M
