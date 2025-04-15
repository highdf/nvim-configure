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
        desc = "Clean compilation artifacts (.aux/.log etc)",
      },
      { "<A-a>o", "<cmd>VimtexCompile<cr>", desc = "Compile LaTeX document" },
      { "<A-a>v", "<cmd>VimtexView<cr>", desc = "Preview PDF in Zathura" },
    },
  },
}
