return {
  {
    "folke/trouble.nvim",
    opts = {},

    keys = {
      {
        "<leader>co",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Show location list",
      },
      {
        "<leader>cq",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Show quickfix list",
      },
      {
        "<leader>cd",
        "<cmd>Trouble diagnostics toggle focus=true<cr>",
        desc = "Show diagnostics",
      },

      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle<cr>",
        desc = "View document symbols",
      },

      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle win.position=right<cr>",
        desc = "LSP definitions/references",
      },
    },
  },
}
