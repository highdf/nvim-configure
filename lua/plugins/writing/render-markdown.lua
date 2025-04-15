return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.icons",
    },
    ft = { "markdown", "quarto", "codecompanion" },

    keys = {
      {
        "<leader>mr",
        mode = "n",
        "<cmd>RenderMarkdown toggle<cr>",
        desc = "Toggle markdown render",
      },
    },

    opts = {
      enabled = true,
      completions = { lsp = { enabled = true } },
      preset = "none",
      heading = {
        signs = { "" },
        border = true,
      },

      code = {
        enabled = true,
        width = "block",
        border = "thin",
        language = true,
        language_icon = true,
        style = "full",
      },

      bullet = {
        enabled = true,
        icons = {
          "●",
          "○",
          "◆",
          "◇",
          "■",
          "□",
        },
      },
    },

    config = function (_, opts) require ("render-markdown").setup (opts) end,
  },
}
