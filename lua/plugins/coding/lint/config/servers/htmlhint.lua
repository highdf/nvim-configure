local pattern = ".*: line (%d+), col (%d+), (%a+) %- (.+) %((.+)%)"
local groups = { "lnum", "col", "severity", "message", "code" }
local ft = { "html" }

local lint_util = require ("plugins.coding.lint.util")
local config_path = lint_util.project_path ("html.conf")
-- print ("config_path = ", config_path)

local severities = {
  error = vim.diagnostic.severity.ERROR,
  warning = vim.diagnostic.severity.WARN,
}

return {
  cmd = "htmlhint",
  stdin = true,
  ft = ft,
  args = {
    "stdin",
    "-f",
    "compact",
    "--config",
    config_path,
  },
  stream = "stdout",
  ignore_exitcode = true,
  parser = require ("lint.parser").from_pattern (
    pattern,
    groups,
    severities,
    { source = "htmlhint" }
  ),
}
