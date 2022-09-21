local M = {}

M.scheme = {
	base3 = '#1d2026',
	base4 = '#333842',
	base5 = '#4d5154',
	base6 = '#9ca0a4',
	base7 = '#b1b1b1',
	base8 = '#e3e3e1',
	border = '#a1b5b1',
	brown = '#d1ca86',
	white = '#f8f8f0',
	grey = '#8F908A',
	black = '#000000',
	pink = '#f92672',
	green = '#a6e22e',
	aqua = '#66d9ef',
	yellow = '#e6db74',
	orange = '#fd971f',
	purple = '#ae81ff',
	red = '#e95678',

	background = '#282923',
	highlighted_word_bg = '#343942',
	const_pink = '#e878d2',
	tree_bg = '#1a1a18',
	telescope_bg = '#181816', -- Slightly darker than tree_bg
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

	-- plugins
	nvim_cmp_fuzzy_fg = '#34d8f7',
	git_signs_add = '#6a921a',
	git_signs_change = '#0e72cf',
}

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
			bg = scheme.pmenu_thum_bg
		},
		PmenuSbar = {
			bg = scheme.base3,
		},
		Cursor = {
			style = 'reverse',
		},
		ColorColumn = {
			bg = scheme.base3,
		},
		CursorLine = {
			bg = scheme.cursor_line_bg
		},
		NonText = { -- used for "eol", "extends" and "precedes" in listchars
			fg = scheme.base5,
		},
		Visual = {
			bg = scheme.visual_bg,
		},
		VisualNOS = {
			bg = scheme.base3,
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
			fg = scheme.pink,
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
			fg = scheme.base7,
			bg = scheme.base3,
		},
		StatusLineNC = {
			fg = scheme.grey,
			bg = scheme.base3,
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
			ctermfg = scheme.pink,
			style = 'undercurl',
		},
		SpecialKey = {
			fg = scheme.pink,
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
			fg = scheme.pink,
		},
		Folded = {
			fg = scheme.grey,
			bg = scheme.base3,
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
			fg = scheme.pink,
		},
		Operator = {
			fg = scheme.pink,
		},
		Label = {
			fg = scheme.pink,
		},
		Keyword = {
			fg = scheme.pink,
			style = 'italic',
		},
		PreProc = {
			fg = scheme.green,
		},
		Include = {
			fg = scheme.pink,
		},
		Define = {
			fg = scheme.pink,
		},
		Macro = {
			fg = scheme.pink,
		},
		PreCondit = {
			fg = scheme.pink,
		},
		Special = {
			fg = scheme.white,
		},
		SpecialChar = {
			fg = scheme.pink,
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
			fg = scheme.base6,
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
			bg = scheme.base3,
		},
		Whitespace = { -- Indent lines
			fg = scheme.base4,
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
			fg = scheme.pink,
		},
		Repeat = {
			fg = scheme.pink,
		},
		Exception = {
			fg = scheme.pink,
		},
		TSString = {
			fg = scheme.yellow,
		},
		TSInclude = {
			fg = scheme.pink,
		},
		TSVariable = {
			fg = scheme.white,
		},
		TSVariableBuiltin = {
			fg = scheme.orange,
		},
		TSAnnotation = {
			fg = scheme.green,
		},
		TSComment = {
			fg = scheme.base6,
			style = 'none',
		},
		TSConstant = {
			fg = scheme.const_pink,
			style = 'none',
		},
		TSConstBuiltin = {
			fg = scheme.purple,
		},
		TSConstMacro = {
			fg = scheme.pink,
			style = 'none',
		},
		TSConstructor = {
			fg = scheme.aqua,
			style = 'none',
		},
		TSConditional = {
			fg = scheme.pink,
		},
		TSCharacter = {
			fg = scheme.yellow,
		},
		TSFunction = {
			fg = scheme.aqua,
			style = 'none',
		},
		TSFuncBuiltin = {
			fg = scheme.aqua,
		},
		TSFuncMacro = {
			fg = scheme.const_pink,
			style = 'italic',
		},
		TSAttribute = {
			fg = scheme.pink,
			style = 'none',
		},
		TSKeyword = {
			fg = scheme.pink,
			style = 'italic',
		},
		TSKeywordFunction = {
			fg = scheme.green,
			style = 'italic',
		},
		TSKeywordOperator = {
			fg = scheme.pink,
		},
		TSKeywordReturn = {
			fg = scheme.pink,
		},
		TSMethod = {
			fg = scheme.aqua,
			style = 'none',
		},
		TSNamespace = {
			fg = scheme.purple,
		},
		TSNumber = {
			fg = scheme.purple,
		},
		TSOperator = {
			fg = scheme.pink,
		},
		TSParameter = {
			fg = scheme.orange,
			style = 'italic',
		},
		TSParameterReference = {
			fg = scheme.white,
		},
		TSProperty = {
			fg = scheme.white,
		},
		TSPunctDelimiter = {
			fg = scheme.white,
		},
		TSPunctBracket = {
			fg = scheme.white,
		},
		TSPunctSpecial = {
			fg = scheme.pink,
		},
		TSRepeat = {
			fg = scheme.pink,
		},
		TSStringRegex = {
			fg = scheme.purple,
		},
		TSStringEscape = {
			fg = scheme.purple,
		},
		TSTag = {
			fg = scheme.pink,
		},
		TSTagDelimiter = {
			fg = scheme.white,
		},
		TSTagAttribute = {
			fg = scheme.green,
		},
		TSLabel = {
			fg = scheme.white,
			style = 'italic',
		},
		TSType = {
			fg = scheme.green,
			style = 'italic',
		},
		TSException = {
			fg = scheme.pink,
		},
		TSField = {
			fg = scheme.white,
		},
		TSFloat = {
			fg = scheme.purple,
		},
		TSCall = {
			fg = scheme.pink,
			style = 'none',
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
			bg = scheme.tree_bg
		},
		NvimTreeWindowPicker = {
			fg = scheme.pink,
			bg = scheme.base3,
			style = 'bold'
		},
		NvimTreeFolderName = {
			fg = scheme.white,
		},
		NvimTreeRootFolder = {
			fg = scheme.pink,
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
			fg = scheme.pink,
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
			fg = scheme.base6
		},
		CmpItemKindKeyword = {
			fg = scheme.pink
		},
		CmpItemKindVariable = {
			fg = scheme.pink
		},
		CmpItemKindConstant = {
			fg = scheme.pink
		},
		CmpItemKindReference = {
			fg = scheme.pink
		},
		CmpItemKindValue = {
			fg = scheme.pink
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
		-- ray-x/lsp_signature.nvim
		LspSignatureActiveParameter = {
			fg = scheme.orange
		},
		-- sindrets/diffview.nvim
		DiffviewNormal = {
			bg = scheme.tree_bg
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
			bg = scheme.telescope_bg,
		},
		TreesitterContextLineNumber = {
			bg = scheme.telescope_bg,
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
