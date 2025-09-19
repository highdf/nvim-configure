return {
    {
        "mfussenegger/nvim-lint",

        event = "BufReadPost",

        config = function ()
            local lint_util = require ("utils.lint_util")
            local lint = require ("lint")

            lint.linters_by_ft = lint_util.linters_by_ft ()

            lint.linters = lint_util.lintters ()

            local lint_augroup =
                vim.api.nvim_create_augroup ("lint_augroup", { clear = true })
            vim.api.nvim_create_autocmd (
                { "BufReadPost", "BufWritePost", "BufEnter" },
                {
                    group = lint_augroup, -- 将自动命令放入组中便于管理:cite[1]
                    callback = function () require ("lint").try_lint () end,
                }
            )
        end,
    },
}
