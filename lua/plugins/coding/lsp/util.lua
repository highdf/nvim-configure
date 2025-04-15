local M = {}

local tb_util = require ("utils.table")
local config_path =
  vim.fs.joinpath (vim.fn.stdpath ("config"), "lua/plugins/coding/lsp/config")
local require_path = config_path
  :gsub ("^" .. vim.fn.stdpath ("config") .. "/lua/", "")
  :gsub ("/", ".")

function M.enable_lsps ()
  local filenames = tb_util.get_lua_files_glob (config_path, "*.lua")
  local ignore_list = {}

  for _, filename in pairs (filenames) do
    local server_name = string.gsub (filename, "%.lua", "")

    if not ignore_list[server_name] then
      local config = require (require_path .. "." .. server_name)

      vim.lsp.config (server_name, config)
      vim.lsp.enable (server_name, true)
    end
  end
end

return M
