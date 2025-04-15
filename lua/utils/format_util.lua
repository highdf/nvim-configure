local M = {}
local table_util = require("utils.table")

M.config_path = vim.fn.stdpath("config") .. "/lua/coding/format/formatters/"
M.formatters_require_path = "coding.format.formatters."
M.ft_table_require = "coding.format.ft"
M.project_config_path = vim.fn.stdpath("config") .. "/lua/coding/format/config/"

local function init_config(config)
	local mason_util = require("utils.mason")

	if config.command then
		config.command = mason_util.bin_path() .. config.command
	end
end

function M.formatters()
	local formatters = {}
	local files = table_util.get_lua_files_glob(M.config_path, "*.lua")

	for _, file in ipairs(files) do
		local module_name = string.gsub(file, "%.lua", "")
		local config = require(M.formatters_require_path .. module_name)

		init_config(config)

		formatters[module_name] = config
	end

	-- for name, tb in pairs(formatters) do
	-- 	print("name = ", name, "tb_length", table_util.get_table_size(tb))
	-- end

	return formatters
end

function M.ft_table()
	return require(M.ft_table_require)
end

return M
