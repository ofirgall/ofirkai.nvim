---@mod ofirkai.design
local M = {}

---The default scheme table
---@type table
M.scheme = {
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
	yellow = '#e6db74',
	orange = '#fd971f',
	purple = '#ae81ff',
	red = '#e95678',
	light_pink = '#f92672',
	dark_pink = '#e878d2',

	-- Specific colors
	whitespace_fg = '#333842',
	non_text_fg = '#4d5154',
	comment_fg = '#9ca0a4',
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
	vert_split_fg = '#948f5a',
	tabline_fg = '#f20aee',
	tabline_sel_fg = '#78b6e8',

	-- Plugins colors
	nvim_cmp_fuzzy_fg = '#34d8f7',
	git_signs_add = '#6a921a',
	git_signs_change = '#0e72cf',
}

---The highlight groups
M.hl_groups = function(scheme)
	return {
		Normal = {
			fg = scheme.white,
			bg = scheme.background,
		},
		NormalFloat = {
			bg = scheme.background,
		},
		Pmenu = {
			fg = scheme.white,
			bg = scheme.pmenu_bg,
		},
		PmenuSel = {
			fg = scheme.white,
			bg = scheme.pmenu_sel_bg
		},
		PmenuSelBold = {
			fg = scheme.white,
			bg = scheme.pmenu_sel_bg
		},
		PmenuThumb = {
			fg = scheme.purple,
			bg = scheme.pmenu_thumb_bg
		},
		Cursor = {
			style = 'reverse',
		},
		ColorColumn = {
			bg = scheme.secondary_background,
		},
		CursorLine = {
			bg = scheme.cursor_line_bg
		},
		NonText = { -- used for "eol", "extends" and "precedes" in listchars
			fg = scheme.non_text_fg,
		},
		Visual = {
			bg = scheme.visual_bg,
		},
		VisualNOS = {
			bg = scheme.secondary_background,
		},
		Search = {
			bg = scheme.search_bg,
		},
		IncSearch = {
			fg = scheme.background,
			bg = scheme.orange,
		},
		CursorLineNr = {
			bg = scheme.cursor_line_bg,
			fg = scheme.yellow,
		},
		MatchParen = {
			fg = scheme.light_pink,
		},
		Question = {
			fg = scheme.yellow,
		},
		ModeMsg = {
			fg = scheme.white,
			style = 'bold',
		},
		MoreMsg = {
			fg = scheme.white,
			style = 'bold',
		},
		ErrorMsg = {
			fg = scheme.red,
			style = 'bold',
		},
		WarningMsg = {
			fg = scheme.yellow,
			style = 'bold',
		},
		VertSplit = {
			fg = scheme.vert_split_fg
		},
		LineNr = {
			bg = scheme.background,
			fg = scheme.orange,
		},
		SignColumn = {
			fg = scheme.white,
			bg = scheme.background,
		},
		StatusLine = {
			fg = scheme.comment_fg,
			bg = scheme.secondary_background,
		},
		StatusLineNC = {
			fg = scheme.grey,
			bg = scheme.secondary_background,
		},
		Tabline = {
			fg = scheme.tabline_fg,
			bg = scheme.highlighted_word_bg,
		},
		TabLineFill = {},
		TabLineSel = {
			fg = scheme.tabline_sel_fg,
			bg = scheme.highlighted_word_bg,
		},
		SpellBad = {
			ctermfg = scheme.red,
			style = 'undercurl'
		},
		SpellCap = {
			ctermfg = scheme.purple,
			style = 'undercurl',
		},
		SpellRare = {
			ctermfg = scheme.aqua,
			style = 'undercurl',
		},
		SpellLocal = {
			ctermfg = scheme.light_pink,
			style = 'undercurl',
		},
		SpecialKey = {
			fg = scheme.light_pink,
		},
		Title = {
			fg = scheme.yellow,
			style = 'bold',
		},
		Directory = {
			fg = scheme.aqua,
		},
		DiffAdd = {
			bg = scheme.diff_add,
		},
		DiffDelete = {
			bg = scheme.diff_remove,
		},
		DiffChange = {
			bg = scheme.diff_change,
		},
		DiffText = {
			bg = scheme.diff_text,
		},
		diffAdded = {
			fg = scheme.green,
		},
		diffRemoved = {
			fg = scheme.light_pink,
		},
		Folded = {
			fg = scheme.grey,
			bg = scheme.secondary_background,
		},
		FoldColumn = {
			fg = scheme.white,
			bg = scheme.black,
		},
		Constant = {
			fg = scheme.aqua,
		},
		Number = {
			fg = scheme.purple,
		},
		Float = {
			fg = scheme.purple,
		},
		Boolean = {
			fg = scheme.purple,
		},
		Character = {
			fg = scheme.yellow,
		},
		String = {
			fg = scheme.yellow,
		},
		Type = {
			fg = scheme.aqua,
		},
		Structure = {
			fg = scheme.aqua,
		},
		StorageClass = {
			fg = scheme.aqua,
		},
		Typedef = {
			fg = scheme.aqua,
		},
		Identifier = {
			fg = scheme.white,
		},
		Function = {
			fg = scheme.green,
			style = 'italic',
		},
		Statement = {
			fg = scheme.light_pink,
		},
		Operator = {
			fg = scheme.light_pink,
		},
		Label = {
			fg = scheme.light_pink,
		},
		Keyword = {
			fg = scheme.light_pink,
			style = 'italic',
		},
		PreProc = {
			fg = scheme.green,
		},
		Include = {
			fg = scheme.light_pink,
		},
		Define = {
			fg = scheme.light_pink,
		},
		Macro = {
			fg = scheme.light_pink,
		},
		PreCondit = {
			fg = scheme.light_pink,
		},
		Special = {
			fg = scheme.white,
		},
		SpecialChar = {
			fg = scheme.light_pink,
		},
		Delimiter = {
			fg = scheme.white,
		},
		SpecialComment = {
			fg = scheme.grey,
			style = 'italic',
		},
		Tag = {
			fg = scheme.orange,
		},
		Todo = {
			fg = scheme.orange,
		},
		Comment = {
			fg = scheme.comment_fg,
			style = 'italic',
		},
		Underlined = {
			style = 'underline',
		},
		Ignore = {},
		Error = {
			fg = scheme.red,
		},
		Terminal = {
			fg = scheme.white,
			bg = scheme.background,
		},
		EndOfBuffer = {
			fg = scheme.background,
		},
		Conceal = {
			fg = scheme.grey,
		},
		vCursor = {
			style = 'reverse',
		},
		iCursor = {
			style = 'reverse',
		},
		lCursor = {
			style = 'reverse',
		},
		CursorIM = {
			style = 'reverse',
		},
		CursorColumn = {
			bg = scheme.secondary_background,
		},
		whitespace_fg = { -- Indent lines
			fg = scheme.whitespace_fg,
			style = 'none',
		},
		WildMenu = {
			fg = scheme.white,
			bg = scheme.orange,
		},
		QuickFixLine = {
			fg = scheme.purple,
			style = 'bold',
		},
		Debug = {
			fg = scheme.orange,
		},
		debugBreakpoint = {
			fg = scheme.background,
			bg = scheme.red,
		},
		Conditional = {
			fg = scheme.light_pink,
		},
		Repeat = {
			fg = scheme.light_pink,
		},
		Exception = {
			fg = scheme.light_pink,
		},
		['@string'] = {
			fg = scheme.yellow,
		},
		['@string.regex'] = {
			fg = scheme.purple,
		},
		['@string.escape'] = {
			fg = scheme.purple,
		},
		['@string.special'] = {
			fg = scheme.light_pink,
		},
		['@include'] = {
			fg = scheme.light_pink,
		},
		['@variable'] = {
			fg = scheme.white,
		},
		['@variable.builtin'] = {
			fg = scheme.orange,
		},
		['@annotation'] = {
			fg = scheme.green,
		},
		['@comment'] = {
			fg = scheme.comment_fg,
			style = 'none',
		},
		['@constant'] = {
			fg = scheme.dark_pink,
			style = 'none',
		},
		['@constant.builtin'] = {
			fg = scheme.purple,
		},
		['@constant.macro'] = {
			fg = scheme.light_pink,
			style = 'none',
		},
		['@text.reference'] = { -- Linked to `Constant` by default
			fg = scheme.aqua,
			style = 'none',
		},
		['@text.environment'] = { -- Linked to `Macro` by default
			fg = scheme.light_pink,
		},
		['@text.environment.name'] = { -- Linked to `Type` by default
			fg = scheme.aqua,
		},
		['@constructor'] = {
			fg = scheme.aqua,
			style = 'none',
		},
		['@conditional'] = {
			fg = scheme.light_pink,
		},
		['@character'] = {
			fg = scheme.yellow,
		},
		['@character.special'] = {
			fg = scheme.light_pink,
		},
		['@function'] = {
			fg = scheme.aqua,
			style = 'none',
		},
		['@function.call'] = {
			fg = scheme.aqua,
			style = 'none',
		},
		['@function.builtin'] = {
			fg = scheme.aqua,
		},
		['@function.macro'] = {
			fg = scheme.dark_pink,
			style = 'italic',
		},
		['@attribute'] = {
			fg = scheme.light_pink,
			style = 'none',
		},
		['@keyword'] = {
			fg = scheme.light_pink,
			style = 'italic',
		},
		['@keyword.function'] = {
			fg = scheme.green,
			style = 'italic',
		},
		['@keyword.operator'] = {
			fg = scheme.light_pink,
		},
		['@keyword.return'] = {
			fg = scheme.light_pink,
		},
		['@method'] = {
			fg = scheme.aqua,
			style = 'none',
		},
		['@method.call'] = { -- TODO: Was 'TSCall' not sure if its the correct one
			fg = scheme.light_pink,
			style = 'none',
		},
		['@namespace'] = {
			fg = scheme.purple,
		},
		['@number'] = {
			fg = scheme.purple,
		},
		['@operator'] = {
			fg = scheme.light_pink,
		},
		['@parameter'] = {
			fg = scheme.orange,
			style = 'italic',
		},
		['@parameter.reference'] = {
			fg = scheme.white,
		},
		['@property'] = {
			fg = scheme.white,
		},
		['@punctuation.delimiter'] = {
			fg = scheme.white,
		},
		['@punctuation.bracket'] = {
			fg = scheme.white,
		},
		['@punctuation.special'] = {
			fg = scheme.light_pink,
		},
		['@repeat'] = {
			fg = scheme.light_pink,
		},
		['@tag'] = {
			fg = scheme.light_pink,
		},
		['@tag.delimiter'] = {
			fg = scheme.white,
		},
		['@tag.attribute'] = {
			fg = scheme.green,
		},
		['@label'] = {
			fg = scheme.white,
			style = 'italic',
		},
		['@type'] = {
			fg = scheme.green,
			style = 'italic',
		},
		['@type.builtin'] = {
			fg = scheme.green,
			style = 'italic',
		},
		['@type.qualifier'] = {
			fg = scheme.green,
			style = 'italic',
		},
		['@type.definition'] = {
			fg = scheme.aqua,
		},
		['@exception'] = {
			fg = scheme.light_pink,
		},
		['@field'] = {
			fg = scheme.white,
		},
		['@float'] = {
			fg = scheme.purple,
		},
		['@boolean'] = {
			fg = scheme.purple,
		},
		['@symbol'] = {
			fg = scheme.purple,
		},
		['@debug'] = {
			fg = scheme.orange,
		},
		['@define'] = {
			fg = scheme.light_pink,
		},
		['@preproc'] = {
			fg = scheme.comment_fg,
			style = 'none',
		},
		['@storageclass'] = {
			fg = scheme.aqua,
		},
		['@todo'] = {
			fg = scheme.orange,
		},
		['@none'] = {
		},
		['@text'] = {
		},
		['@text.strong'] = {
			style = 'bold'
		},
		['@text.emphasis'] = {
			style = 'italic'
		},
		['@text.underline'] = {
			style = 'underline'
		},
		['@text.strike'] = {
			style = 'strikethrough'
		},
		['@text.title'] = {
			fg = scheme.yellow,
			style = 'bold',
		},
		['@text.literal'] = {
			fg = scheme.yellow,
		},
		['@text.uri'] = {
			style = 'underline',
		},
		['@text.math'] = {
			fg = scheme.white,
		},
		['@text.note'] = {
			fg = scheme.purple,
			style = 'italic',
		},
		['@text.warning'] = {
			fg = scheme.orange,
		},
		['@text.danger'] = {
			fg = scheme.yellow,
			style = 'bold',
		},
		dbui_tables = {
			fg = scheme.white,
		},
		DiagnosticSignError = {
			fg = scheme.red,
		},
		DiagnosticSignWarn = {
			fg = scheme.yellow,
		},
		DiagnosticSignInfo = {
			fg = scheme.white,
		},
		DiagnosticSignHint = {
			fg = scheme.aqua,
		},
		DiagnosticVirtualTextError = {
			fg = scheme.red,
		},
		DiagnosticVirtualTextWarn = {
			fg = scheme.yellow,
		},
		DiagnosticVirtualTextInfo = {
			fg = scheme.white,
		},
		DiagnosticVirtualTextHint = {
			fg = scheme.aqua,
		},
		DiagnosticUnderlineError = {
			style = 'undercurl',
			sp = scheme.red,
		},
		DiagnosticUnderlineWarn = {
			style = 'undercurl',
			sp = scheme.yellow,
		},
		DiagnosticUnderlineInfo = {
			style = 'undercurl',
			sp = scheme.white,
		},
		DiagnosticUnderlineHint = {
			style = 'undercurl',
			sp = scheme.aqua,
		},
		CursorWord0 = {
			bg = scheme.white,
			fg = scheme.black,
		},
		CursorWord1 = {
			bg = scheme.white,
			fg = scheme.black,
		},
		LspReferenceText = {
			bg = scheme.highlighted_word_bg,
			style = 'underline',
		},
		LspReferenceRead = {
			bg = scheme.highlighted_word_bg,
			style = 'underline',
		},
		LspReferenceWrite = {
			bg = scheme.highlighted_word_bg,
			style = 'underline',
		},
		LspSignatureHintVirtualText = {
			fg = scheme.lightorange,
			style = 'bold'
		},
		-- kyazdani42/nvim-tree.lua
		NvimTreeNormal = {
			bg = scheme.ui_bg
		},
		NvimTreeWindowPicker = {
			fg = scheme.light_pink,
			bg = scheme.secondary_background,
			style = 'bold'
		},
		NvimTreeFolderName = {
			fg = scheme.white,
		},
		NvimTreeRootFolder = {
			fg = scheme.light_pink,
		},
		NvimTreeSpecialFile = {
			fg = scheme.white,
			style = 'NONE',
		},
		-- nvim-telescope/telescope.nvim
		TelescopeBorder = {
			fg = scheme.telescope_bg,
			bg = scheme.telescope_bg,
		},
		TelescopeNormal = {
			bg = scheme.telescope_bg
		},
		TelescopePromptNormal = {
			fg = scheme.white,
			bg = scheme.telescope_prompt,
		},
		TelescopePromptBorder = {
			fg = scheme.telescope_prompt,
			bg = scheme.telescope_prompt,
		},
		TelescopePromptPrefix = {
			fg = scheme.local_orange,
			bg = scheme.telescope_prompt,
		},
		TelescopePromptTitle = {
			fg = scheme.white,
			bg = scheme.telescope_prompt,
			style = 'bold'
		},
		TelescopeResultsTitle = {
			fg = scheme.telescope_bg,
			bg = scheme.telescope_bg,
		},
		TelescopeSelection = {
			bg = scheme.cursor_line_bg,
			fg = scheme.white,
			style = 'none'
		},
		TelescopeSelectionCaret = {
			fg = scheme.green,
		},
		TelescopeMultiSelection = {
			fg = scheme.light_pink,
		},
		TelescopeMatching = {
			fg = scheme.aqua,
		},
		TelescopePreviewNormal = {
			bg = scheme.background
		},
		TelescopePreviewTitle = {
			fg = scheme.white,
		},
		-- hrsh7th/nvim-cmp
		CmpDocumentation = {
			fg = scheme.white,
			bg = scheme.background
		},
		CmpDocumentationBorder = {
			fg = scheme.white, bg = scheme.background
		},
		CmpItemAbbr = {
			fg = scheme.white
		},
		CmpItemAbbrMatch = {
			fg = scheme.nvim_cmp_fuzzy_fg,
		},
		CmpItemAbbrMatchFuzzy = {
			fg = scheme.nvim_cmp_fuzzy_fg,
		},
		CmpItemKindDefault = {
			fg = scheme.white
		},
		CmpItemMenu = {
			fg = scheme.comment_fg
		},
		CmpItemKindKeyword = {
			fg = scheme.light_pink
		},
		CmpItemKindVariable = {
			fg = scheme.light_pink
		},
		CmpItemKindConstant = {
			fg = scheme.light_pink
		},
		CmpItemKindReference = {
			fg = scheme.light_pink
		},
		CmpItemKindValue = {
			fg = scheme.light_pink
		},
		CmpItemKindFunction = {
			fg = scheme.aqua
		},
		CmpItemKindMethod = {
			fg = scheme.aqua
		},
		CmpItemKindConstructor = {
			fg = scheme.aqua
		},
		CmpItemKindClass = {
			fg = scheme.orange
		},
		CmpItemKindInterface = {
			fg = scheme.orange
		},
		CmpItemKindStruct = {
			fg = scheme.orange
		},
		CmpItemKindEvent = {
			fg = scheme.orange
		},
		CmpItemKindEnum = {
			fg = scheme.orange
		},
		CmpItemKindUnit = {
			fg = scheme.orange
		},
		CmpItemKindModule = {
			fg = scheme.yellow
		},
		CmpItemKindProperty = {
			fg = scheme.green
		},
		CmpItemKindField = {
			fg = scheme.green
		},
		CmpItemKindTypeParameter = {
			fg = scheme.green
		},
		CmpItemKindEnumMember = {
			fg = scheme.green
		},
		CmpItemKindOperator = {
			fg = scheme.green
		},
		-- sindrets/diffview.nvim
		DiffviewNormal = {
			bg = scheme.ui_bg
		},
		-- lewis6991/gitsigns.nvim
		GitSignsAdd = {
			fg = scheme.git_signs_add,
		},
		GitSignsChange = {
			fg = scheme.git_signs_change
		},
		-- nvim-treesitter/nvim-treesitter-context
		TreesitterContext = {
			bg = scheme.winbar_bg,
		},
		TreesitterContextLineNumber = {
			bg = scheme.winbar_bg,
			fg = scheme.purple
		},
		-- nvim-lualine/lualine.nvim
		LuaLineDiffAdd = {
			fg = scheme.green,
		},
		LuaLineDiffChange = {
			fg = scheme.tabline_sel_fg,
		},
		LuaLineDiffDelete = {
			fg = scheme.red,
		},
	}
end

return M
