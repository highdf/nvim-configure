return {
  {
    "mfussenegger/nvim-lint",

    event = "VeryLazy",

    config = function ()
      -- local lint_util = require ("utils.lint_util")
      local setup = require ("plugins.coding.lint.setup")
      local lint = require ("lint")

      lint.linters_by_ft = setup.linters_by_ft

      lint.linters = setup.linters

      local lint_augroup =
        vim.api.nvim_create_augroup ("lint_augroup", { clear = true })
      vim.api.nvim_create_autocmd (
        { "BufReadPost", "BufWritePost", "BufEnter" },
        {
          group = lint_augroup,
          callback = function () require ("lint").try_lint () end,
        }
      )
    end,
  },
}
