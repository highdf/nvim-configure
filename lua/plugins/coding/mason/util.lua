local M = {}

local mason = require ("mason-registry")
local json_util = require ("utils.json_util")
local path = vim.fs.joinpath (
  vim.fn.stdpath ("config"),
  "lua/plugins/coding/mason/packages.json"
)

local function is_child_set (child_set, parent_set)
  local ret = true

  for _, child_value in ipairs (child_set) do
    local is_contain = false

    for _, parent_value in ipairs (parent_set) do
      if parent_value == child_value then is_contain = true end
    end

    if is_contain == false then
      ret = false
      vim.notify (
        "Element: " .. child_value .. "is not in parent_set",
        vim.log.levels.ERROR
      )
    end
  end

  return ret
end

local function complement_set (child_set, parent_set)
  local complement = {}

  if is_child_set (child_set, parent_set) == true then
    for _, parent_value in ipairs (parent_set) do
      local is_contain = false

      for _, child_value in ipairs (child_set) do
        if parent_value == child_value then is_contain = true end
      end

      if is_contain == false then table.insert (complement, parent_value) end
    end
  end

  -- vim.notify ("child_set: " .. vim.inspect (child_set))
  -- vim.notify ("parent_set: " .. vim.inspect (parent_set))
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

function M.sync_data ()
  local require_package = json_util.json_to_table (path)
  sync_packages (require_package)
end

return M
