local M = {}

-- brown
local float_color = '#131426'
local telescope_preview_border = '#12131b'
local sidebar_cursorline_bg = '#24292b'

M.scheme = {
	-- midnight.nvim
	background = '#080c10',
	telescope_prompt = float_color,
	telescope_bg = '#0f1018',

	cursor_line_bg = '#1b1f21',
	cursor_linenr_fg = '#909ef5',
	line_fg = '#383f80',
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
	tab_visible_fg = '#5c8014',

	vert_split_fg = '#253b52',
	vert_split_fg_active = '#004f9a',
	git_signs_add = '#567e06',
	git_signs_change = '#0063c0',

	-- darker diff colors
	diff_add = '#293e04',
	diff_remove = '#400519',
	diff_change = '#182c57',
	diff_text = '#14233e',

	status_line = {
		a_fg = '#434343',
		b_bg = '#363640',
		c_bg = '#2a2a30',

		normal = '#7ea6eb',
		insert = '#d48050',
		visual = '#feacd0',
		replace = '#ffa0a0',
		command = '#88cf88',

		inactive = '#202020',
	},

	buffer_line = {
		bg = '#15162a',
		fg = '#9ca0a4',
		selected_bg = '#1c1e38',
		selected_fg = '#edede5',
		visible_fg = '#5c8014',
		visible_bg = '#15162a', -- same as bg
	},
}

M.hl_groups = function(scheme)
	return {
		-- TODO: ????
		TelescopePreviewBorder = {
			fg = telescope_preview_border,
			bg = telescope_preview_border,
		},

		NvimTreeCursorLine = {
			bg = sidebar_cursorline_bg,
		},
		NvimTreeCursorLineNr = {
			bg = sidebar_cursorline_bg,
			fg = scheme.cursor_linenr_fg,
		},
		DiffviewCursorLine = {
			link = 'NvimTreeCursorLine',
		},
		TroubleCursorLine = {
			bg = scheme.diff_text,
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

		WarningMsg = {
			fg = scheme.orange,
			bold = true,
		},
	}
end

return M
