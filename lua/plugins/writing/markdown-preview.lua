return {
  {
    "iamcco/markdown-preview.nvim",
    lazy = true,
    build = "cd app && pnpm install",
    ft = { "markdown" },

    keys = {
      {
        "<leader>mp",
        mode = "n",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "preview markdown in a brower",
      },
    },
  },
}
