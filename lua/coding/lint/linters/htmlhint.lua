local pattern = ".*: line (%d+), col (%d+), (%a+) %- (.+) %((.+)%)"
local groups = { "lnum", "col", "severity", "message", "code" }

local lint_util = require ("utils.lint_util")
local config_path = lint_util.project_config_path .. "html.conf"
-- print ("config_path = ", config_path)

local severities = {
    error = vim.diagnostic.severity.ERROR,
    warning = vim.diagnostic.severity.WARN,
}

return {
    cmd = "htmlhint",
    stdin = true,
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
