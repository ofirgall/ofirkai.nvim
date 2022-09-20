local M = {}

M.scheme = {
	base0 = '#222426',
	base1 = '#272a30',
	base2 = '#26292C',
	base3 = '#2E323C',
	base4 = '#333842',
	base5 = '#4d5154',
	base6 = '#9ca0a4',
	base7 = '#b1b1b1',
	base8 = '#e3e3e1',
	border = '#a1b5b1',
	brown = '#504945',
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
	diff_add = '#3d5213',
	diff_remove = '#4a0f23',
	diff_change = '#27406b',
	diff_text = '#23324d',
}

M.hl_groups = function(colorscheme)
	return {
		Normal = {
			fg = colorscheme.white,
			bg = colorscheme.base2,
		},
		NormalFloat = {
			bg = colorscheme.base1,
		},
		Pmenu = {
			fg = colorscheme.white,
			bg = colorscheme.base3,
		},
		PmenuSel = {
			fg = colorscheme.base4,
			bg = colorscheme.orange,
		},
		PmenuSelBold = {
			fg = colorscheme.base4,
			bg = colorscheme.orange,
		},
		PmenuThumb = {
			fg = colorscheme.purple,
			bg = colorscheme.green,
		},
		PmenuSbar = {
			bg = colorscheme.base3,
		},
		Cursor = {
			style = 'reverse',
		},
		ColorColumn = {
			bg = colorscheme.base3,
		},
		CursorLine = {
			bg = colorscheme.base3,
		},
		NonText = { -- used for "eol", "extends" and "precedes" in listchars
			fg = colorscheme.base5,
		},
		Visual = {
			bg = colorscheme.base4,
		},
		VisualNOS = {
			bg = colorscheme.base3,
		},
		Search = {
			fg = colorscheme.base2,
			bg = colorscheme.yellow,
		},
		IncSearch = {
			fg = colorscheme.base2,
			bg = colorscheme.orange,
		},
		CursorLineNr = {
			fg = colorscheme.orange,
			bg = colorscheme.base2,
		},
		MatchParen = {
			fg = colorscheme.pink,
		},
		Question = {
			fg = colorscheme.yellow,
		},
		ModeMsg = {
			fg = colorscheme.white,
			style = 'bold',
		},
		MoreMsg = {
			fg = colorscheme.white,
			style = 'bold',
		},
		ErrorMsg = {
			fg = colorscheme.red,
			style = 'bold',
		},
		WarningMsg = {
			fg = colorscheme.yellow,
			style = 'bold',
		},
		VertSplit = {
			fg = colorscheme.brown,
		},
		LineNr = {
			fg = colorscheme.base5,
			bg = colorscheme.base2,
		},
		SignColumn = {
			fg = colorscheme.white,
			bg = colorscheme.base2,
		},
		StatusLine = {
			fg = colorscheme.base7,
			bg = colorscheme.base3,
		},
		StatusLineNC = {
			fg = colorscheme.grey,
			bg = colorscheme.base3,
		},
		Tabline = {},
		TabLineFill = {},
		TabLineSel = {
			bg = colorscheme.base4,
		},
		SpellBad = {
			fg = colorscheme.red,
			style = 'undercurl',
		},
		SpellCap = {
			fg = colorscheme.purple,
			style = 'undercurl',
		},
		SpellRare = {
			fg = colorscheme.aqua,
			style = 'undercurl',
		},
		SpellLocal = {
			fg = colorscheme.pink,
			style = 'undercurl',
		},
		SpecialKey = {
			fg = colorscheme.pink,
		},
		Title = {
			fg = colorscheme.yellow,
			style = 'bold',
		},
		Directory = {
			fg = colorscheme.aqua,
		},
		DiffAdd = {
			bg = colorscheme.diff_add,
		},
		DiffDelete = {
			bg = colorscheme.diff_remove,
		},
		DiffChange = {
			bg = colorscheme.diff_change,
		},
		DiffText = {
			bg = colorscheme.diff_text,
		},
		diffAdded = {
			fg = colorscheme.green,
		},
		diffRemoved = {
			fg = colorscheme.pink,
		},
		Folded = {
			fg = colorscheme.grey,
			bg = colorscheme.base3,
		},
		FoldColumn = {
			fg = colorscheme.white,
			bg = colorscheme.black,
		},
		Constant = {
			fg = colorscheme.aqua,
		},
		Number = {
			fg = colorscheme.purple,
		},
		Float = {
			fg = colorscheme.purple,
		},
		Boolean = {
			fg = colorscheme.purple,
		},
		Character = {
			fg = colorscheme.yellow,
		},
		String = {
			fg = colorscheme.yellow,
		},
		Type = {
			fg = colorscheme.aqua,
		},
		Structure = {
			fg = colorscheme.aqua,
		},
		StorageClass = {
			fg = colorscheme.aqua,
		},
		Typedef = {
			fg = colorscheme.aqua,
		},
		Identifier = {
			fg = colorscheme.white,
		},
		Function = {
			fg = colorscheme.green,
			style = 'italic',
		},
		Statement = {
			fg = colorscheme.pink,
		},
		Operator = {
			fg = colorscheme.pink,
		},
		Label = {
			fg = colorscheme.pink,
		},
		Keyword = {
			fg = colorscheme.pink,
			style = 'italic',
		},
		PreProc = {
			fg = colorscheme.green,
		},
		Include = {
			fg = colorscheme.pink,
		},
		Define = {
			fg = colorscheme.pink,
		},
		Macro = {
			fg = colorscheme.pink,
		},
		PreCondit = {
			fg = colorscheme.pink,
		},
		Special = {
			fg = colorscheme.white,
		},
		SpecialChar = {
			fg = colorscheme.pink,
		},
		Delimiter = {
			fg = colorscheme.white,
		},
		SpecialComment = {
			fg = colorscheme.grey,
			style = 'italic',
		},
		Tag = {
			fg = colorscheme.orange,
		},
		Todo = {
			fg = colorscheme.orange,
		},
		Comment = {
			fg = colorscheme.base6,
			style = 'italic',
		},
		Underlined = {
			style = 'underline',
		},
		Ignore = {},
		Error = {
			fg = colorscheme.red,
		},
		Terminal = {
			fg = colorscheme.white,
			bg = colorscheme.base2,
		},
		EndOfBuffer = {
			fg = colorscheme.base2,
		},
		Conceal = {
			fg = colorscheme.grey,
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
			bg = colorscheme.base3,
		},
		Whitespace = { -- used for "nbsp", "space", "tab" and "trail" in listchars
			fg = colorscheme.base5,
		},
		WildMenu = {
			fg = colorscheme.white,
			bg = colorscheme.orange,
		},
		QuickFixLine = {
			fg = colorscheme.purple,
			style = 'bold',
		},
		Debug = {
			fg = colorscheme.orange,
		},
		debugBreakpoint = {
			fg = colorscheme.base2,
			bg = colorscheme.red,
		},
		Conditional = {
			fg = colorscheme.pink,
		},
		Repeat = {
			fg = colorscheme.pink,
		},
		Exception = {
			fg = colorscheme.pink,
		},
		TSString = {
			fg = colorscheme.yellow,
		},
		TSInclude = {
			fg = colorscheme.pink,
		},
		TSVariable = {
			fg = colorscheme.white,
		},
		TSVariableBuiltin = {
			fg = colorscheme.orange,
		},
		TSAnnotation = {
			fg = colorscheme.green,
		},
		TSComment = {
			fg = colorscheme.base6,
			style = 'italic',
		},
		TSConstant = {
			fg = colorscheme.aqua,
		},
		TSConstBuiltin = {
			fg = colorscheme.purple,
		},
		TSConstMacro = {
			fg = colorscheme.purple,
		},
		TSConstructor = {
			fg = colorscheme.aqua,
		},
		TSConditional = {
			fg = colorscheme.pink,
		},
		TSCharacter = {
			fg = colorscheme.yellow,
		},
		TSFunction = {
			fg = colorscheme.green,
			style = 'italic',
		},
		TSFuncBuiltin = {
			fg = colorscheme.aqua,
		},
		TSFuncMacro = {
			fg = colorscheme.green,
			style = 'italic',
		},
		TSKeyword = {
			fg = colorscheme.pink,
			style = 'italic',
		},
		TSKeywordFunction = {
			fg = colorscheme.pink,
			style = 'italic',
		},
		TSKeywordOperator = {
			fg = colorscheme.pink,
		},
		TSKeywordReturn = {
			fg = colorscheme.pink,
		},
		TSMethod = {
			fg = colorscheme.green,
		},
		TSNamespace = {
			fg = colorscheme.purple,
		},
		TSNumber = {
			fg = colorscheme.purple,
		},
		TSOperator = {
			fg = colorscheme.pink,
		},
		TSParameter = {
			fg = colorscheme.white,
		},
		TSParameterReference = {
			fg = colorscheme.white,
		},
		TSProperty = {
			fg = colorscheme.white,
		},
		TSPunctDelimiter = {
			fg = colorscheme.white,
		},
		TSPunctBracket = {
			fg = colorscheme.white,
		},
		TSPunctSpecial = {
			fg = colorscheme.pink,
		},
		TSRepeat = {
			fg = colorscheme.pink,
		},
		TSStringRegex = {
			fg = colorscheme.purple,
		},
		TSStringEscape = {
			fg = colorscheme.purple,
		},
		TSTag = {
			fg = colorscheme.pink,
		},
		TSTagDelimiter = {
			fg = colorscheme.white,
		},
		TSTagAttribute = {
			fg = colorscheme.green,
		},
		TSLabel = {
			fg = colorscheme.pink,
		},
		TSType = {
			fg = colorscheme.aqua,
		},
		TSException = {
			fg = colorscheme.pink,
		},
		TSField = {
			fg = colorscheme.white,
		},
		TSFloat = {
			fg = colorscheme.purple,
		},
		dbui_tables = {
			fg = colorscheme.white,
		},
		DiagnosticSignError = {
			fg = colorscheme.red,
		},
		DiagnosticSignWarn = {
			fg = colorscheme.yellow,
		},
		DiagnosticSignInfo = {
			fg = colorscheme.white,
		},
		DiagnosticSignHint = {
			fg = colorscheme.aqua,
		},
		DiagnosticVirtualTextError = {
			fg = colorscheme.red,
		},
		DiagnosticVirtualTextWarn = {
			fg = colorscheme.yellow,
		},
		DiagnosticVirtualTextInfo = {
			fg = colorscheme.white,
		},
		DiagnosticVirtualTextHint = {
			fg = colorscheme.aqua,
		},
		DiagnosticUnderlineError = {
			style = 'undercurl',
			sp = colorscheme.red,
		},
		DiagnosticUnderlineWarn = {
			style = 'undercurl',
			sp = colorscheme.yellow,
		},
		DiagnosticUnderlineInfo = {
			style = 'undercurl',
			sp = colorscheme.white,
		},
		DiagnosticUnderlineHint = {
			style = 'undercurl',
			sp = colorscheme.aqua,
		},
		CursorWord0 = {
			bg = colorscheme.white,
			fg = colorscheme.black,
		},
		CursorWord1 = {
			bg = colorscheme.white,
			fg = colorscheme.black,
		},
		NvimTreeFolderName = {
			fg = colorscheme.white,
		},
		NvimTreeRootFolder = {
			fg = colorscheme.pink,
		},
		NvimTreeSpecialFile = {
			fg = colorscheme.white,
			style = 'NONE',
		},

		-- Telescope
		TelescopeBorder = {
			fg = colorscheme.base7,
		},
		TelescopeNormal = {
			fg = colorscheme.base8,
			bg = colorscheme.base0,
		},
		TelescopeSelection = {
			fg = colorscheme.white,
			style = 'bold',
		},
		TelescopeSelectionCaret = {
			fg = colorscheme.green,
		},
		TelescopeMultiSelection = {
			fg = colorscheme.pink,
		},
		TelescopeMatching = {
			fg = colorscheme.aqua,
		},

		-- hrsh7th/nvim-cmp
		CmpDocumentation = { fg = colorscheme.white, bg = colorscheme.base1 },
		CmpDocumentationBorder = { fg = colorscheme.white, bg = colorscheme.base1 },

		CmpItemAbbr = { fg = colorscheme.white },
		CmpItemAbbrMatch = { fg = colorscheme.aqua },
		CmpItemAbbrMatchFuzzy = { fg = colorscheme.aqua },

		CmpItemKindDefault = { fg = colorscheme.white },
		CmpItemMenu = { fg = colorscheme.base6 },

		CmpItemKindKeyword = { fg = colorscheme.pink },
		CmpItemKindVariable = { fg = colorscheme.pink },
		CmpItemKindConstant = { fg = colorscheme.pink },
		CmpItemKindReference = { fg = colorscheme.pink },
		CmpItemKindValue = { fg = colorscheme.pink },

		CmpItemKindFunction = { fg = colorscheme.aqua },
		CmpItemKindMethod = { fg = colorscheme.aqua },
		CmpItemKindConstructor = { fg = colorscheme.aqua },

		CmpItemKindClass = { fg = colorscheme.orange },
		CmpItemKindInterface = { fg = colorscheme.orange },
		CmpItemKindStruct = { fg = colorscheme.orange },
		CmpItemKindEvent = { fg = colorscheme.orange },
		CmpItemKindEnum = { fg = colorscheme.orange },
		CmpItemKindUnit = { fg = colorscheme.orange },

		CmpItemKindModule = { fg = colorscheme.yellow },

		CmpItemKindProperty = { fg = colorscheme.green },
		CmpItemKindField = { fg = colorscheme.green },
		CmpItemKindTypeParameter = { fg = colorscheme.green },
		CmpItemKindEnumMember = { fg = colorscheme.green },
		CmpItemKindOperator = { fg = colorscheme.green },

		-- ray-x/lsp_signature.nvim
		LspSignatureActiveParameter = { fg = colorscheme.orange },
	}
end

return M
