local M = {}

local tb_util = require('utils.table')
local relative_path = '/lua/coding/dap/'
M.config_dir_path = vim.fn.stdpath('config') .. relative_path
M.require_path = 'coding.dap.'

function M.require_configs()
	local files = tb_util.get_lua_files_glob(M.config_dir_path, "*.lua")

	for _, file in ipairs(files) do
		local module_name = string.gsub(file, "%.lua", "")
		require(M.require_path .. module_name)
	end
end

return M
