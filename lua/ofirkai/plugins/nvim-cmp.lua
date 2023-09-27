---@mod ofirkai.plugins.nvim-cmp
local M = {}

---The design I use for `window.completion` and `window.documentation`
---@type table
M.design = {
	border = 'single',
	winhighlight = 'Normal:CmpFloat,FloatBorder:CmpFloatBorder,CursorLine:Visual,Search:None',
	zindex = 1001,
}

---nvim-cmp `window` configuration
---@type table
M.window = {
	completion = M.design,
	documentation = M.design,
}

---lsp-kind.nvim icons
---@type table
M.kind_icons = {
	Text = '',
	Method = '',
	Function = '',
	Constructor = '',
	Field = '',
	Variable = '',
	Class = 'ﴯ',
	Interface = '',
	Module = '',
	Property = 'ﰠ',
	Unit = '',
	Value = '',
	Enum = '',
	Keyword = '',
	Snippet = '',
	Color = '',
	File = '',
	Reference = '',
	Folder = '',
	EnumMember = '',
	Constant = '',
	Struct = '',
	Event = '',
	Operator = '',
	TypeParameter = '',
}

return M
