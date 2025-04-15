local M = {}

local tb_util = require ("utils.table")
local config_path =
  vim.fs.joinpath (vim.fn.stdpath ("config"), "lua/plugins/coding/dap/config")
local mod_prefix = config_path
  :gsub ("^" .. vim.fn.stdpath ("config") .. "/lua/", "")
  :gsub ("/", ".")

function M.require_configs ()
  local files = tb_util.get_lua_files_glob (config_path, "*.lua")

  for _, file in ipairs (files) do
    local module_name = string.gsub (file, "%.lua", "")
    require (mod_prefix .. "." .. module_name)
  end
end

return M
