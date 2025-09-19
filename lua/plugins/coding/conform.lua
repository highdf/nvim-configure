return {
    {
        "stevearc/conform.nvim",

        event = "BufReadPost",

        config = function ()
            local format_util = require ("utils.format_util")
            local conform = require ("conform")

            conform.setup ({
                log_level = vim.log.levels.DEBUG,
                formatters_by_ft = format_util.ft_table (),
                formatters = format_util.formatters (),
            })

            local conform_group =
                vim.api.nvim_create_augroup ("conform_group", { clear = true })
            vim.api.nvim_create_autocmd ({ "BufReadPost", "BufWritePre" }, {
                group = conform_group,
                pattern = "*",
                callback = function (args)
                    require ("conform").format ({ bufnr = args.buf })
                end,
            })
        end,
    },
}
