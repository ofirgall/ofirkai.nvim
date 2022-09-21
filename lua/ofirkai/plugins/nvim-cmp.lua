local M = {}

M.design = {
	border = 'rounded',
	winhighlight = 'Normal:Normal,CursorLine:Visual,Search:None',
	zindex = 1001,
}

M.window = {
	completion = M.design,
	documentation = M.design,
}

return M
