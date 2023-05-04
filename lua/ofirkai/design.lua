---@mod ofirkai.design
local M = {}

---Alias for the default scheme table
---@type table
M.scheme = require('ofirkai.schemes').default

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
			bg = scheme.pmenu_sel_bg,
		},
		PmenuSelBold = {
			fg = scheme.white,
			bg = scheme.pmenu_sel_bg,
		},
		PmenuThumb = {
			fg = scheme.purple,
			bg = scheme.pmenu_thumb_bg,
		},
		Cursor = {
			reverse = true,
		},
		ColorColumn = {
			bg = scheme.secondary_background,
		},
		CursorLine = {
			bg = scheme.cursor_line_bg,
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
			fg = scheme.match_paren,
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
			fg = scheme.vert_split_fg,
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
		FloatTitle = {
			fg = scheme.yellow,
			bold = true,
			bg = scheme.ui_bg,
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
			reverse = true,
		},
		iCursor = {
			reverse = true,
		},
		lCursor = {
			reverse = true,
		},
		CursorIM = {
			reverse = true,
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
		['@constant.builtin.rust'] = { -- Some, Ok, Err
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
		['@attribute.builtin.python'] = {
			link = '@attribute.python'
		},
		['@keyword'] = {
			fg = scheme.light_red,
			italic = true,
		},
		['@keyword.luadoc'] = {
			fg = scheme.dark_pink,
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
			fg = scheme.dark_yellow,
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
		['@label.jsonc'] = {
			link = '@label.json'
		},
		['@label'] = {
			fg = scheme.white,
			italic = true,
		},
		['@label.c'] = {
			fg = scheme.teal,
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
		['@type.builtin.c'] = {
			link = '@type'
		},
		['@type.builtin.cpp'] = {
			link = '@type'
		},
		['@type.qualifier'] = { -- rust `mut`
			fg = scheme.light_red,
			italic = true,
		},
		['@type.definition'] = {
			link = '@type'
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
		['@preproc.cpp'] = {
			link = '@preproc.c'
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
			underline = true,
		},
		['@text.strike'] = {
			strikethrough = true,
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
		DiagnosticUnnecessary = {
			undercurl = true,
			sp = scheme.unnecessary_fg,
			italic = true,
		},
		DiagnosticError = {
			link = 'DiagnosticVirtualTextError'
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
			bg = scheme.ui_bg,
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
		NvimTreeGitDirty = {
			fg = scheme.orange,
		},
		NvimTreeGitStaged = {
			fg = scheme.green,
		},
		NvimTreeGitNew = {
			fg = scheme.yellow,
		},
		NvimTreeGitRenamed = {
			fg = scheme.aqua,
		},
		-- nvim-telescope/telescope.nvim
		TelescopeBorder = {
			fg = scheme.telescope_bg,
			bg = scheme.telescope_bg,
		},
		TelescopeNormal = {
			bg = scheme.telescope_bg,
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
			bg = scheme.background,
		},
		TelescopePreviewTitle = {
			fg = scheme.white,
		},
		-- hrsh7th/nvim-cmp
		CmpDocumentation = {
			fg = scheme.white,
			bg = scheme.background,
		},
		CmpDocumentationBorder = {
			fg = scheme.white, bg = scheme.background,
		},
		CmpItemAbbr = {
			fg = scheme.white,
		},
		CmpItemAbbrMatch = {
			fg = scheme.nvim_cmp_fuzzy_fg,
		},
		CmpItemAbbrMatchFuzzy = {
			fg = scheme.nvim_cmp_fuzzy_fg,
		},
		CmpItemKindDefault = {
			fg = scheme.white,
		},
		CmpItemMenu = {
			fg = scheme.comment_fg,
		},
		CmpItemKindKeyword = {
			fg = scheme.light_red,
		},
		CmpItemKindVariable = {
			fg = scheme.light_red,
		},
		CmpItemKindConstant = {
			fg = scheme.light_red,
		},
		CmpItemKindReference = {
			fg = scheme.light_red,
		},
		CmpItemKindValue = {
			fg = scheme.light_red,
		},
		CmpItemKindFunction = {
			fg = scheme.aqua,
		},
		CmpItemKindMethod = {
			fg = scheme.aqua,
		},
		CmpItemKindConstructor = {
			fg = scheme.aqua,
		},
		CmpItemKindClass = {
			fg = scheme.orange,
		},
		CmpItemKindInterface = {
			fg = scheme.orange,
		},
		CmpItemKindStruct = {
			fg = scheme.orange,
		},
		CmpItemKindEvent = {
			fg = scheme.orange,
		},
		CmpItemKindEnum = {
			fg = scheme.orange,
		},
		CmpItemKindUnit = {
			fg = scheme.orange,
		},
		CmpItemKindModule = {
			fg = scheme.yellow,
		},
		CmpItemKindProperty = {
			fg = scheme.green,
		},
		CmpItemKindField = {
			fg = scheme.green,
		},
		CmpItemKindTypeParameter = {
			fg = scheme.green,
		},
		CmpItemKindEnumMember = {
			fg = scheme.green,
		},
		CmpItemKindOperator = {
			fg = scheme.green,
		},
		-- sindrets/diffview.nvim
		DiffviewNormal = {
			bg = scheme.ui_bg,
		},
		-- lewis6991/gitsigns.nvim
		GitSignsAdd = {
			fg = scheme.git_signs_add,
		},
		GitSignsChange = {
			fg = scheme.git_signs_change,
		},
		-- nvim-treesitter/nvim-treesitter-context
		TreesitterContext = {
			bg = scheme.winbar_bg,
		},
		TreesitterContextLineNumber = {
			bg = scheme.winbar_bg,
			fg = scheme.purple,
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
		DapUIVariable = {
			link = '@parameter'
		},
		DapUIType = {
			link = '@type'
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
			fg = scheme.aqua,
		},
		NoiceCmdlineIconFilter = {
			fg = scheme.yellow,
		},
		NoiceCmdlineIconLua = {
			fg = scheme.red,
		},
		NoiceCmdlineIconSearch = {
			fg = scheme.orange,
		},
		NoiceCmdlineIconHelp = {
			fg = scheme.dark_pink,
		},
		NoiceCmdlinePopup = { -- Actual search line
			link = 'FloatNormal'
		},
		NoiceCmdlinePopupBorder = {
			link = 'FloatBorder'
		},
		NoiceCmdlinePopupBorderCmdline = {
			link = 'FloatBorder'
		},
		NoiceCmdlinePopupBorderFilter = {
			link = 'FloatBorder'
		},
		NoiceCmdlinePopupBorderLua = {
			link = 'FloatBorder'
		},
		NoiceCmdlinePopupBorderSearch = {
			link = 'FloatBorder'
		},
		-- Progress Bar
		NoiceFormatProgressDone = {
			bg = scheme.secondary_background,
		},
		NoiceFormatProgressTodo = {
			bg = scheme.telescope_bg,
		},
		NoiceFormatTitle = {
			bg = scheme.background,
		},
		NoiceLspProgressClient = {
			fg = scheme.yellow,
			bg = scheme.background,
			bold = true,
		},
		NoiceLspProgressSpinner = {
			fg = scheme.aqua,
			bg = scheme.background,
		},
		NoiceLspProgressTitle = {
			fg = scheme.white,
			bg = scheme.background,
		},
		-- ThePrimeagen/harpoon
		HarpoonWindow = {
			link = 'WhiteBorder'
		},
		HarpoonBorder = {
			link = 'WhiteBorder'
		},
		-- folke/lazy.nvim
		--- General
		LazyH1 = {
			fg = scheme.yellow,
			bg = scheme.ui_bg,
			bold = true,
		},
		LazyH2 = {
			fg = scheme.orange,
			bold = true,
		},
		--- Reasons
		LazyReasonCmd = {
			fg = scheme.yellow,
		},
		LazyReasonEvent = {
			fg = scheme.aqua,
		},
		LazyReasonFt = {
			fg = scheme.teal,
		},
		LazyReasonImport = {
			fg = scheme.dark_yellow,
		},
		LazyReasonKeys = {
			fg = scheme.dark_pink,
		},
		LazyReasonPlugin = {
			fg = scheme.red,
		},
		LazyReasonRuntime = {
			fg = scheme.orange,
		},
		LazyReasonSource = {
			fg = scheme.purple,
		},
		LazyReasonStart = {
			fg = scheme.green,
		},
		----- Additional hl groups -----
		InlayHints = { -- For InlayHints
			fg = scheme.dimmed_aqua,
		},
		WhiteBorder = {
			-- For floats that needs border
			fg = scheme.white,
			bg = scheme.ui_bg,
		},
		-- nvimdev/lspsaga.nvim
		SagaBorder = {
			link = 'FloatBorder'
		},
		SagaNormal = {
			link = 'NormalFloat'
		},
		DiagnosticShowBorder = {
			link = 'FloatBorder'
		},
		TitleString = {
			link = 'FloatTitle'
		},
	}
end

return M
