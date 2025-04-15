return {
  {
    "iamcco/markdown-preview.nvim",
    lazy = true,
    build = "cd app && npm install",
    ft = { "markdown" },

    keys = {
      {
        "<leader>mp",
        mode = "n",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "切换Markdown实时预览",
      },
    },
  },
}
