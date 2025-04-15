return {
  {
    "stevearc/conform.nvim",

    event = { "BufReadPost", "VeryLazy" },

    config = function ()
      local conform = require ("conform")
      local setup = require ("plugins.coding.conform.setup")

      conform.setup (setup)

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
