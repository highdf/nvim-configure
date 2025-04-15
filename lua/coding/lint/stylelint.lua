local severities = {
    warning = vim.diagnostic.severity.WARN,
    error = vim.diagnostic.severity.ERROR,
}

local lint_util = require ("utils.lint_util")
local config_path = lint_util.project_config_path .. "stylelintrc.json"

return {
    cmd = "stylelint",
    stdin = true,
    args = {
        "--config",
        config_path,
        "-f",
        "json",
        "--stdin",
        "--stdin-filename",
        function () return vim.fn.expand ("%:p") end,
    },
    stream = "both",
    ignore_exitcode = true,
    parser = function (output)
        local status, decoded = pcall (vim.json.decode, output)
        if status then
            decoded = decoded[1]
        else
            decoded = {
                warnings = {
                    {
                        line = 1,
                        column = 1,
                        text = "Stylelint error, run `stylelint "
                            .. vim.fn.expand ("%")
                            .. "` for more info.",
                        severity = "error",
                        rule = "none",
                    },
                },
                errored = true,
            }
        end
        local diagnostics = {}
        for _, message in ipairs (decoded.warnings) do
            table.insert (diagnostics, {
                lnum = message.line - 1,
                col = message.column - 1,
                end_lnum = message.line - 1,
                end_col = message.column - 1,
                message = message.text,
                code = message.rule,
                user_data = {
                    lsp = {
                        code = message.rule,
                    },
                },
                severity = severities[message.severity],
                source = "stylelint",
            })
        end
        return diagnostics
    end,
}
