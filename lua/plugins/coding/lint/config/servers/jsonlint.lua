local pattern = "line (%d+), col (%d+), (.*)"
local groups = { "lnum", "col", "message" }
local severities = nil -- none provided
local ft = { "json" }

return {
  cmd = "jsonlint",
  stream = "stderr",
  args = { "--compact" },
  stdin = true,
  ft = ft,
  ignore_exitcode = true,
  parser = require ("lint.parser").from_pattern (pattern, groups, severities, {
    source = "jsonlint",
    severity = vim.diagnostic.severity.ERROR,
  }),
}
