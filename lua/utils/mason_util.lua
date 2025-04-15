local M = {}

local mason = require ("mason-registry")
local json_util = require ("utils.json_util")
local path = vim.fn.stdpath ("config") .. "/lua/coding/mason/packages.json"

local function complement_set (child_set, parent_set)
  local complement = {}

  for _, parent_value in ipairs (parent_set) do
    local is_have = false

    for _, child_value in ipairs (child_set) do
      if parent_value == child_value then is_have = true end
    end

    if is_have == false then table.insert (complement, parent_value) end
  end

  return complement
end

local function sync_packages (require_package)
  local local_package = mason.get_installed_package_names ()
  local cmd = ""
  local set, child_set, parent_set = {}, {}, {}

  if #local_package < #require_package then
    cmd = "MasonInstall "
    child_set = local_package
    parent_set = require_package
  elseif #local_package > #require_package then
    cmd = "MasonUninstall "
    child_set = require_package
    parent_set = local_package
  end

  set = complement_set (child_set, parent_set)

  for _, name in ipairs (set) do
    if mason.has_package (name) then
      vim.notify (cmd .. name, vim.log.levels.INFO)
      vim.api.nvim_command (cmd .. name)
    else
      vim.notify ("Not known package name: " .. name, vim.log.levels.ERROR)
    end
  end
end

function M.bin_path () return vim.fn.stdpath ("data") .. "/mason/bin/" end

function M.sync_data ()
  local require_package = json_util.json_to_table (path)
  sync_packages (require_package)
end

return M
