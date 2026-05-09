local lualine_require = require("lualine_require")
local lsp_status = lualine_require.require("lualine.components.lsp_status")

local M = lsp_status:extend()
local default_icons = {
	cssmodules_ls = "󰌜 ",
	lua_ls = " ",
	-- Ruby
	ruby_lsp = " ",
	solargraph = " ",
	rubocop = " ",
	sorbet = " ",
	steep = " ",
	-- Markdown
	marksman = " ",
	["render-markdown"] = " ",
	-- TypeScript / JavaScript
	ts_ls = " ",
	vtsls = " ",
	eslint = " ",
	biome = " ",
}


local default_colors = {
	ts_ls = "#3178c6",
	cssmodules_ls = "#2d9d4f",
	["render-markdown"] = "#56d4dd",
	ruby_lsp = "#e63946",
	vtsls = "#3178c6",
	eslint = "#9d4edd",
	lua_ls = "#51a0cf",
}

function M:init(options)
	M.super.init(self, options)

	local ok, grandline = pcall(require, "grandline")
	local config_icons = ok and grandline.config.lsp_icons or {}

	self.icons = vim.tbl_extend("force", default_icons, config_icons, options.icons or {})
	self.icon_colors = vim.tbl_extend("force", default_colors, options.icon_colors or {})

	-- Create highlight groups for colored icons (inherits section bg automatically)
	self.icon_hls = {}
	for name, color in pairs(self.icon_colors) do
		self.icon_hls[name] = self:create_hl({ fg = color }, name)
	end
end

function M:update_status()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if #clients == 0 then
		return ""
	end

	local hrtime = (vim.uv or vim.loop).hrtime
	local spinner_symbol = self.symbols.spinner[math.floor(hrtime() / (1e6 * 80)) % #self.symbols.spinner + 1]

	local seen = {}
	local parts = {}
	for _, client in ipairs(clients) do
		local name = client.name
		if not seen[name] and not vim.list_contains(self.options.ignore_lsp, name) then
			seen[name] = true
			local icon = self.icons[name] or (name .. " ")

			local hl = self.icon_hls[name]
			if hl then
				icon = self:format_hl(hl) .. icon .. self:get_default_hl()
			end

			local work = self.lsp_work_by_client_id[client.id]
			if work ~= nil and work > 0 then
				icon = icon .. " " .. spinner_symbol
			elseif work ~= nil and work == 0 then
				icon = icon
			end

			table.insert(parts, icon)
		end
	end

	return table.concat(parts, self.symbols.separator)
end

return M
