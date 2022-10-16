---@mod ofirkai.plugins.nvim-cmp
local M = {}

---The design I use for `window.completion` and `window.documentation`
M.design = {
	border = 'rounded',
	winhighlight = 'Normal:Normal,CursorLine:Visual,Search:None',
	zindex = 1001,
}

---nvim-cmp `window` configuration
M.window = {
	completion = M.design,
	documentation = M.design,
}

---lsp-kind.nvim icons
M.kind_icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = ""
}


return M
