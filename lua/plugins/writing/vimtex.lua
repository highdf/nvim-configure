return {
  {
    "lervag/vimtex",
    ft = "tex",

    init = function ()
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_view_method = "zathura"
      vim.g.tex_flavor = "latex"
      vim.g.vimtex_compiler_method = "latexmk"
    end,

    keys = {
      {
        "<A-a>c",
        "<cmd>VimtexClean<cr>",
        desc = "清理编译产物(.aux/.log等)",
      },
      { "<A-a>o", "<cmd>VimtexCompile<cr>", desc = "编译LaTeX文档" },
      { "<A-a>v", "<cmd>VimtexView<cr>", desc = "在Zathura中预览PDF" },
    },
  },
}
