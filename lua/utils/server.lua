local M = {}
local utils_table = require ("utils.table")

local function make_ft_table (ft_table, ft, mod_name)
  for _, item in ipairs (ft) do
    ft_table[item] = { mod_name }
    -- vim.notify("filetype: ", item)
    -- vim.notify("formatter: ", mod_name)
  end
end

function M.generate_config (servers_path)
  local ft_table = {}
  local formatters = {}

  local filenames = utils_table.get_lua_files_glob (servers_path, "*.lua")

  for _, filename in ipairs (filenames) do
    local mod_name = filename:gsub ("%.lua", "")
    local server_path = vim.fs.joinpath (servers_path, mod_name)
    local mod_path = server_path
      :gsub ("^" .. vim.fn.stdpath ("config") .. "/lua/", "")
      :gsub ("/", ".")
    local mod = require (mod_path)

    make_ft_table (ft_table, mod.ft, mod_name)
    mod.ft = nil
    formatters[mod_name] = mod
  end

  return ft_table, formatters
end

return M
