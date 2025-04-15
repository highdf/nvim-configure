return {
  {
    "mzlogin/vim-markdown-toc",

    ft = { "markdown", "quarto", "codecompanion" },

    config = function ()
      local map = vim.keymap.set
      local opt = { noremap = true, silent = true }
      map (
        "n",
        "<leader>mi",
        "<cmd>GenTocGFM<cr>",
        vim.tbl_extend ("force", opt, {
          desc = "生成GitHub风格目录",
        })
      )
      map (
        "n",
        "<leader>md",
        "<cmd>RemoveToc<cr>",
        vim.tbl_extend ("force", opt, {
          desc = "删除目录",
        })
      )
    end,
  },
}
