---@mod ofirkai.plugins.fff
local M = {}

---`hl` configuration for `dmtrKovalenko/fff.nvim`
---@type table
---@usage [[
---require('fff').setup {
---	hl = require('ofirkai.plugins.fff').hl,
---}
---@usage ]]
M.hl = {
	normal = 'FffNormal',
	border = 'FffBorder',
	title = 'FffTitle',
	cursor = 'FffCursorLine',
	matched = 'FffMatched',
	frecency = 'FffFrecency',
	directory_path = 'FffDirectory',
	scrollbar = 'FffScrollbar',
	combo_header = 'FffComboHeader',
	suggestion_header = 'FffSuggestionHeader',
	debug = 'FffDebug',
	grep_match = 'FffGrepMatch',
	grep_line_number = 'FffGrepLineNr',
	winhl = {
		-- `LineNr` is the matches count, fff.nvim hardcodes it with no `hl` key
		prompt = 'Normal:FffPrompt,FloatBorder:FffPromptBorder,FloatTitle:FffPromptTitle,LineNr:FffCount',
		-- `SignColumn` is the git sign gutter, it would otherwise keep the editor's bg
		list = 'Normal:FffNormal,FloatBorder:FffBorder,FloatTitle:FffTitle,SignColumn:FffNormal',
		preview = 'Normal:FffPreviewNormal,FloatBorder:FffPreviewBorder,FloatTitle:FffPreviewTitle',
		file_info = 'Normal:FffNormal,FloatBorder:FffBorder,FloatTitle:FffTitle',
	},
}

return M
