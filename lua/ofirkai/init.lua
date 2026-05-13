---@mod ofirkai Introduction
---@brief [[
---Monokai theme
---@brief ]]
---@divider -
local M = {}

local design = require('ofirkai.design')

local function highlight(group, color)
	local style = color.style and 'gui=' .. color.style or 'gui=NONE'
	local fg = color.fg and 'guifg = ' .. color.fg or 'guifg = NONE'
	local bg = color.bg and 'guibg = ' .. color.bg or 'guibg = NONE'
	local sp = color.sp and 'guisp = ' .. color.sp or ''
	vim.cmd('highlight ' .. group .. ' ' .. style .. ' ' .. fg .. ' ' .. bg .. ' ' .. sp)
end

local function filter_hl_groups(config, hl_groups)
	for _, colors in pairs(hl_groups) do
		if config.remove_italics then
			if colors.italic then
				colors.italic = false
			end
		end
	end

	return hl_groups
end

local function hex_to_rgb(hex)
	hex = hex:gsub('#', '')
	return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

local function rgb_to_hex(r, g, b)
	return string.format(
		'#%02x%02x%02x',
		math.max(0, math.min(255, r)),
		math.max(0, math.min(255, g)),
		math.max(0, math.min(255, b))
	)
end

local function dim_color(hex, factor)
	if factor == 0 or not hex or type(hex) ~= 'string' or not hex:match('^#%x%x%x%x%x%x$') then
		return hex
	end
	local r, g, b = hex_to_rgb(hex)
	local inv = 1 - factor
	return rgb_to_hex(math.floor(r * inv + 0.5), math.floor(g * inv + 0.5), math.floor(b * inv + 0.5))
end

local syntax_group_set = {
	Normal = true, NormalFloat = true, SidekickChat = true,
	Constant = true, Number = true, Float = true, Boolean = true, Character = true, String = true,
	Type = true, Structure = true, StorageClass = true, Typedef = true,
	Identifier = true, Function = true,
	Statement = true, Operator = true, Label = true, Keyword = true,
	Conditional = true, Repeat = true, Exception = true,
	PreProc = true, Include = true, Define = true, Macro = true, PreCondit = true,
	Special = true, SpecialChar = true, Delimiter = true,
	Tag = true, Todo = true,
	Error = true, Underlined = true, Ignore = true, Debug = true,
	Conceal = true,
	diffAdded = true, diffRemoved = true,
	dbui_tables = true,
	gitcommitSummary = true, gitcommitOverflow = true,
}

local function get_fg_category(group)
	if group == 'Comment' or group == 'SpecialComment' or group:match('^@comment') then
		return 'comments'
	end

	if group:match('^Diagnostic') or group:match('^CursorDiagnostic') then
		return 'diagnostics'
	end

	if syntax_group_set[group] or group:match('^@') then
		return 'syntax'
	end

	return 'ui'
end

local function apply_dim(hl_groups, dim)
	local global = math.max(0, math.min(1, dim.global))
	local resolved = {
		syntax = dim.syntax ~= nil and math.max(0, math.min(1, dim.syntax)) or global,
		comments = dim.comments ~= nil and math.max(0, math.min(1, dim.comments)) or global,
		diagnostics = dim.diagnostics ~= nil and math.max(0, math.min(1, dim.diagnostics)) or global,
		ui = dim.ui ~= nil and math.max(0, math.min(1, dim.ui)) or global,
		background = dim.background ~= nil and math.max(0, math.min(1, dim.background)) or global,
	}

	local has_dim = false
	for _, v in pairs(resolved) do
		if v > 0 then
			has_dim = true
			break
		end
	end
	if not has_dim then
		return hl_groups
	end

	for group, colors in pairs(hl_groups) do
		if not colors.link then
			local cat = get_fg_category(group)
			local fg_factor = resolved[cat]
			local bg_factor = resolved.background

			if fg_factor > 0 then
				colors.fg = dim_color(colors.fg, fg_factor)
				colors.sp = dim_color(colors.sp, fg_factor)
			end
			if bg_factor > 0 then
				colors.bg = dim_color(colors.bg, bg_factor)
			end
		end
	end

	return hl_groups
end

local function dim_scheme_tables(scheme, dim)
	local global = math.max(0, math.min(1, dim.global))
	local fg_factor = dim.ui ~= nil and math.max(0, math.min(1, dim.ui)) or global
	local bg_factor = dim.background ~= nil and math.max(0, math.min(1, dim.background)) or global

	if fg_factor == 0 and bg_factor == 0 then
		return
	end

	local sub_keys = { 'status_line', 'buffer_line' }
	for _, key in ipairs(sub_keys) do
		if scheme[key] then
			for k, v in pairs(scheme[key]) do
				if type(v) == 'string' and v:match('^#%x%x%x%x%x%x$') then
					if k:match('bg') then
						scheme[key][k] = dim_color(v, bg_factor)
					else
						scheme[key][k] = dim_color(v, fg_factor)
					end
				end
			end
		end
	end
end

local default_config = {
	theme = nil,
	scheme = design.scheme,
	custom_hlgroups = {},
	remove_italics = false,
	dim = {
		global = 0,
	},
}

---@param config table user config
---@usage [[
-----Leave empty for default values
---require('ofirkai').setup {
---}
---
----- Or setup with custom parameters
---require('ofirkai').setup {
---	theme = nil -- Choose theme to use, available themes: 'dark_blue'
---
---	scheme = require('ofirkai').scheme -- Option to override scheme
---	custom_hlgroups = {},              -- Option to add/override highlight groups
---	remove_italics = false,            -- Option to change all the italics style to none
---	dim = {
---		global = 0,       -- Default dim for all unset categories (0.0 = none, 1.0 = fully dimmed)
---		syntax = nil,     -- Dim syntax highlight foregrounds (defaults to global)
---		comments = nil,   -- Dim comment foregrounds (defaults to global)
---		diagnostics = nil,-- Dim diagnostic foregrounds and undercurl colors (defaults to global)
---		ui = nil,         -- Dim UI element foregrounds (defaults to global)
---		background = nil, -- Dim all background colors (defaults to global)
---	},
---}
---@usage ]]
M.setup = function(config)
	vim.cmd('hi clear')
	if vim.fn.exists('syntax_on') then
		vim.cmd('syntax reset')
	end
	vim.o.background = 'dark'
	vim.o.termguicolors = true
	vim.g.colors_name = 'ofirkai'

	local theme = nil
	local def_scheme = default_config.scheme

	if config.theme then
		theme = require('ofirkai.themes.' .. config.theme)
	end

	-- Merge scheme from theme to default scheme
	if theme then
		default_config.scheme = vim.tbl_deep_extend('keep', theme.scheme, default_config.scheme)
	end

	-- Merge use config (includes scheme)
	config = config or {}
	config = vim.tbl_deep_extend('keep', config, default_config)

	-- Restore default scheme after using the merged scheme
	if theme then
		default_config.scheme = def_scheme
	end

	-- Set vars of scheme
	M.scheme = config.scheme
	design.scheme = M.scheme
	dim_scheme_tables(M.scheme, config.dim)

	local hl_groups = design.hl_groups(M.scheme)
	if theme then
		hl_groups = vim.tbl_deep_extend('keep', theme.hl_groups(M.scheme), hl_groups)
	end
	hl_groups = vim.tbl_deep_extend('keep', config.custom_hlgroups, hl_groups)

	hl_groups = filter_hl_groups(config, hl_groups)
	hl_groups = apply_dim(hl_groups, config.dim)

	for group, colors in pairs(hl_groups) do
		if colors.ctermfg then
			highlight(group, colors)
		else
			vim.api.nvim_set_hl(0, group, colors)
		end
	end
end

---Alias for require('ofirkai.design').scheme
---@type table
M.scheme = design.scheme

return M
