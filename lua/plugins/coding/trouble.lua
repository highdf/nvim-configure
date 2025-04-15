return {
  {
    "folke/trouble.nvim",
    opts = {},

    keys = {
      {
        "<leader>co",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "显示位置列表",
      },
      {
        "<leader>cq",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "显示快速修复列表",
      },
      {
        "<leader>cd",
        "<cmd>Trouble diagnostics toggle focus=true<cr>",
        desc = "显示诊断信息",
      },

      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle<cr>",
        desc = "查看文档符号",
      },

      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle win.position=right<cr>",
        desc = "LSP定义/引用追踪",
      },
    },
  },
}
