local M = {}
local table_util = require ("utils.table")
local mason_util = require ("utils.mason_util")

M.ft_require_path = "coding.lint.ft"
M.linter_config_path = vim.fn.stdpath ("config") .. "/lua/coding/lint/linters/"
M.linter_require_path = "coding.lint.linters."
M.project_config_path = vim.fn.stdpath ("config")
  .. "/lua/coding/lint/project_config/"

function M.linters_by_ft () return require (M.ft_require_path) end

function M.lintters ()
  local linters = {}
  local files = table_util.get_lua_files_glob (M.linter_config_path, "*.lua")

  for _, file in ipairs (files) do
    local module_name = string.gsub (file, "%.lua", "")
    local config = require (M.linter_require_path .. module_name)
    config.cmd = mason_util.bin_path () .. config.cmd
    linters[module_name] = config
  end

  return linters
end

return M
