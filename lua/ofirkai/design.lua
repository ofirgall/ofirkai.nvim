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
	dimmed_aqua = '#4a7d87',
	yellow = '#e6db74',
	orange = '#fd971f',
	purple = '#ae81ff',
	red = '#e95678',
	light_red = '#f92672',
	dark_pink = '#e878d2',
	teal = '#3ae0b4',

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
	vert_split_fg = '#75724b',
	vert_split_fg_active = '#948f5a', -- TODO: add nvim-zh/colorful-winsep.nvim support
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
			bg = scheme.ui_bg,
		},
		FloatBorder = {
			fg = scheme.ui_bg,
			bg = scheme.ui_bg,
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
			reverse = true
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
			fg = scheme.light_red,
		},
		Question = {
			fg = scheme.yellow,
		},
		ModeMsg = {
			fg = scheme.white,
			bold = true,
		},
		MoreMsg = {
			fg = scheme.white,
			bold = true,
		},
		ErrorMsg = {
			fg = scheme.red,
			bold = true,
		},
		WarningMsg = {
			fg = scheme.yellow,
			bold = true,
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
			ctermfg = scheme.light_red,
			style = 'undercurl',
		},
		SpecialKey = {
			fg = scheme.light_red,
		},
		Title = {
			fg = scheme.yellow,
			bold = true,
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
			fg = scheme.light_red,
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
			italic = true,
		},
		Statement = {
			fg = scheme.light_red,
		},
		Operator = {
			fg = scheme.light_red,
		},
		Label = {
			fg = scheme.light_red,
		},
		Keyword = {
			fg = scheme.light_red,
			italic = true,
		},
		PreProc = {
			fg = scheme.green,
		},
		Include = {
			fg = scheme.light_red,
		},
		Define = {
			fg = scheme.light_red,
		},
		Macro = {
			fg = scheme.light_red,
		},
		PreCondit = {
			fg = scheme.light_red,
		},
		Special = {
			fg = scheme.white,
		},
		SpecialChar = {
			fg = scheme.light_red,
		},
		Delimiter = {
			fg = scheme.white,
		},
		SpecialComment = {
			fg = scheme.grey,
			italic = true,
		},
		Tag = {
			fg = scheme.orange,
		},
		Todo = {
			fg = scheme.orange,
		},
		Comment = {
			fg = scheme.comment_fg,
			italic = true,
		},
		Underlined = {
			underline = true,
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
			reverse = true
		},
		iCursor = {
			reverse = true
		},
		lCursor = {
			reverse = true
		},
		CursorIM = {
			reverse = true
		},
		CursorColumn = {
			bg = scheme.secondary_background,
		},
		whitespace_fg = { -- Indent lines
			fg = scheme.whitespace_fg,
		},
		WildMenu = {
			fg = scheme.white,
			bg = scheme.orange,
		},
		QuickFixLine = {
			fg = scheme.purple,
			bold = true,
		},
		Debug = {
			fg = scheme.orange,
		},
		debugBreakpoint = {
			fg = scheme.background,
			bg = scheme.red,
		},
		Conditional = {
			fg = scheme.light_red,
		},
		Repeat = {
			fg = scheme.light_red,
		},
		Exception = {
			fg = scheme.light_red,
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
			fg = scheme.light_red,
		},
		['@include'] = {
			fg = scheme.light_red,
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
		},
		['@constant'] = {
			fg = scheme.dark_pink,
		},
		['@constant.builtin'] = {
			fg = scheme.purple,
		},
		['@constant.builtin.rust'] = { -- Some, Ok, Err, TODO: `None` should be purple
			fg = scheme.teal,
		},
		['@constant.macro'] = {
			fg = scheme.light_red,
		},
		['@text.reference'] = { -- Linked to `Constant` by default
			fg = scheme.aqua,
		},
		['@text.environment'] = { -- Linked to `Macro` by default
			fg = scheme.light_red,
		},
		['@text.environment.name'] = { -- Linked to `Type` by default
			fg = scheme.aqua,
		},
		['@constructor'] = {
			fg = scheme.aqua,
		},
		['@conditional'] = {
			fg = scheme.light_red,
		},
		['@character'] = {
			fg = scheme.yellow,
		},
		['@character.special'] = {
			fg = scheme.light_red,
		},
		['@function'] = {
			fg = scheme.aqua,
		},
		['@function.call'] = {
			fg = scheme.aqua,
		},
		['@function.builtin'] = {
			fg = scheme.aqua,
		},
		['@function.macro'] = {
			fg = scheme.dark_pink,
			italic = true,
		},
		['@attribute'] = {
			fg = scheme.light_red,
		},
		['@attribute.python'] = {
			fg = scheme.aqua,
			italic = true,
		},
		['@keyword'] = {
			fg = scheme.light_red,
			italic = true,
		},
		['@keyword.function'] = {
			fg = scheme.green,
			italic = true,
		},
		['@keyword.operator'] = {
			fg = scheme.light_red,
		},
		['@keyword.return'] = {
			fg = scheme.light_red,
		},
		['@method'] = {
			fg = scheme.aqua,
		},
		['@method.call'] = {
			fg = scheme.aqua,
		},
		['@namespace'] = {
			fg = scheme.purple,
		},
		['@number'] = {
			fg = scheme.purple,
		},
		['@operator'] = {
			fg = scheme.light_red,
		},
		['@parameter'] = {
			fg = scheme.orange,
			italic = true,
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
			fg = scheme.light_red,
		},
		['@repeat'] = {
			fg = scheme.light_red,
		},
		['@tag'] = {
			fg = scheme.light_red,
		},
		['@tag.delimiter'] = {
			fg = scheme.white,
		},
		['@tag.attribute'] = {
			fg = scheme.green,
		},
		['@label.json'] = {
			fg = scheme.light_red,
		},
		['@label.jsonc'] = { -- TODO: link to @label.json
			fg = scheme.light_red,
		},
		['@label'] = {
			fg = scheme.white,
			italic = true,
		},
		['@field.yaml'] = { -- yaml fields
			fg = scheme.light_red,
		},
		['@type'] = {
			fg = scheme.green,
			italic = true,
		},
		['@type.builtin'] = {
			fg = scheme.aqua,
			italic = true,
		},
		['@type.builtin.c'] = { -- TODO: link to @type
			fg = scheme.green,
			italic = true,
		},
		['@type.builtin.cpp'] = { -- TODO: link to @type
			fg = scheme.green,
			italic = true,
		},
		['@type.qualifier'] = { -- rust `mut`
			fg = scheme.light_red,
			italic = true,
		},
		['@type.definition'] = { -- TODO: link to `@type`
			fg = scheme.green,
			italic = true,
		},
		['@exception'] = {
			fg = scheme.light_red,
		},
		['@exception.rust'] = { -- `panic` TOOD: link to @function.macro
			fg = scheme.dark_pink,
			italic = true,
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
			fg = scheme.light_red,
		},
		['@preproc'] = {
			fg = scheme.comment_fg,
		},
		['@preproc.c'] = { -- `#ifdef`
			fg = scheme.light_red,
		},
		['@preproc.cpp'] = { -- `#ifdef` TODO: link to @preproc.c
			fg = scheme.light_red,
		},
		['@storageclass'] = { -- rust life times
			fg = scheme.light_red,
			italic = true,
		},
		['@todo'] = {
			fg = scheme.orange,
		},
		['@none'] = {
		},
		['@text'] = {
		},
		['@text.strong'] = {
			bold = true,
		},
		['@text.emphasis'] = {
			italic = true,
		},
		['@text.underline'] = {
			underline = true
		},
		['@text.strike'] = {
			strikethrough = true
		},
		['@text.title'] = {
			fg = scheme.yellow,
			bold = true,
		},
		['@text.literal'] = {
			fg = scheme.yellow,
		},
		['@text.uri'] = {
			underline = true,
		},
		['@text.math'] = {
			fg = scheme.white,
		},
		['@text.note'] = {
			fg = scheme.purple,
			italic = true,
		},
		['@text.warning'] = {
			fg = scheme.orange,
		},
		['@text.danger'] = {
			fg = scheme.yellow,
			bold = true,
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
			undercurl = true,
			sp = scheme.red,
		},
		DiagnosticUnderlineWarn = {
			undercurl = true,
			sp = scheme.yellow,
		},
		DiagnosticUnderlineInfo = {
			undercurl = true,
			sp = scheme.white,
		},
		DiagnosticUnderlineHint = {
			undercurl = true,
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
			underline = true,
		},
		LspReferenceRead = {
			bg = scheme.highlighted_word_bg,
			underline = true,
		},
		LspReferenceWrite = {
			bg = scheme.highlighted_word_bg,
			underline = true,
		},
		LspSignatureHintVirtualText = {
			fg = scheme.lightorange,
			bold = true,
		},
		-- kyazdani42/nvim-tree.lua
		NvimTreeNormal = {
			bg = scheme.ui_bg
		},
		NvimTreeWindowPicker = {
			fg = scheme.light_red,
			bg = scheme.secondary_background,
			bold = true,
		},
		NvimTreeFolderName = {
			fg = scheme.white,
		},
		NvimTreeRootFolder = {
			fg = scheme.light_red,
		},
		NvimTreeSpecialFile = {
			fg = scheme.white,
		},
		NvimTreeCursorLineNr = {
			bg = scheme.cursor_line_bg,
			fg = scheme.yellow,
		},
		NvimTreeLineNr = {
			bg = scheme.ui_bg,
			fg = scheme.orange,
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
			bold = true,
		},
		TelescopeResultsTitle = {
			fg = scheme.telescope_bg,
			bg = scheme.telescope_bg,
		},
		TelescopeSelection = {
			bg = scheme.cursor_line_bg,
			fg = scheme.white,
		},
		TelescopeSelectionCaret = {
			fg = scheme.green,
		},
		TelescopeMultiSelection = {
			fg = scheme.light_red,
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
			fg = scheme.light_red
		},
		CmpItemKindVariable = {
			fg = scheme.light_red
		},
		CmpItemKindConstant = {
			fg = scheme.light_red
		},
		CmpItemKindReference = {
			fg = scheme.light_red
		},
		CmpItemKindValue = {
			fg = scheme.light_red
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
		-- dapui.nvim -- TODO: complete shorthand
		DapUIVariable = { -- TODO: link to `@parameter`
			fg = scheme.orange,
		},
		DapUIType = { -- TODO: link to `@type`
			fg = scheme.green,
			italic = true,
		},
		DapUIValue = {
			fg = scheme.yellow,
		},
		-- folke/noice.nvim
		NoiceVirtualText = {
			fg = scheme.comment_fg,
			italic = true,
		},
		NoiceCmdlineIconCmdline = {
			fg = scheme.aqua
		},
		NoiceCmdlineIconFilter = {
			fg = scheme.yellow
		},
		NoiceCmdlineIconLua = {
			fg = scheme.red
		},
		NoiceCmdlineIconSearch = {
			fg = scheme.orange
		},
		NoiceCmdlineIconHelp = {
			fg = scheme.dark_pink
		},
		NoiceCmdlinePopup = { -- Actual search line, TODO: link to FloatNormal
			bg = scheme.ui_bg
		},
		-- TODO: link to FloatBorder and FloatNormal
		NoiceCmdlinePopupBorder = {
			fg = scheme.ui_bg,
			bg = scheme.ui_bg
		},
		NoiceCmdlinePopupBorderCmdline = {
			fg = scheme.ui_bg,
			bg = scheme.ui_bg
		},
		NoiceCmdlinePopupBorderFilter = {
			fg = scheme.ui_bg,
			bg = scheme.ui_bg
		},
		NoiceCmdlinePopupBorderLua = {
			fg = scheme.ui_bg,
			bg = scheme.ui_bg
		},
		NoiceCmdlinePopupBorderSearch = {
			fg = scheme.ui_bg,
			bg = scheme.ui_bg
		},
		-- Progress Bar
		NoiceFormatProgressDone = {
			bg = scheme.secondary_background
		},
		NoiceFormatProgressTodo = {
			bg = scheme.telescope_bg
		},
		NoiceFormatTitle = {
			bg = scheme.background
		},
		NoiceLspProgressClient = {
			fg = scheme.yellow,
			bg = scheme.background,
			bold = true,
		},
		NoiceLspProgressSpinner = {
			fg = scheme.aqua,
			bg = scheme.background
		},
		NoiceLspProgressTitle = {
			fg = scheme.white,
			bg = scheme.background,
		},
		-- ThePrimeagen/harpoon
		HarpoonWindow = { -- TODO link to `WhiteBorder`
			fg = scheme.white,
			bg = scheme.ui_bg,
		},
		HarpoonBorder = { -- TODO link to `WhiteBorder`
			fg = scheme.white,
			bg = scheme.ui_bg,
		},

		----- Additional hl groups -----
		InlayHints = { -- For InlayHints
			fg = scheme.dimmed_aqua,
		},
		WhiteBorder = { -- For floats that needs border
			fg = scheme.white,
			bg = scheme.ui_bg,
		},
	}
end

return M
