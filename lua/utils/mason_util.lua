local M = {}

local mason = require ("mason-registry")
local json_util = require ("utils.json_util")
local path = vim.fn.stdpath ("config") .. "/lua/coding/mason/packages.json"

local function sync_packages (packages)
  for _, name in ipairs (packages) do
    if not mason.is_installed (name) then
      print ("Start install ", name)
      vim.api.nvim_command ("MasonInstall " .. name)
    end
  end
end

function M.bin_path () return vim.fn.stdpath ("data") .. "/mason/bin/" end

function M.sync_data ()
  local packages = json_util.json_to_table (path)
  sync_packages (packages)
end

return M
