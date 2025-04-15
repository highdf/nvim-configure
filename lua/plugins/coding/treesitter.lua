return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,

    opts = {
      ensure_installed = {
        "c",
        "java",
        "lua",
        "python",
        "bash",
        "make",
        "regex",
        "javascript",
        "typescript",
        "html",
        "css",
        "yaml",
        "xml",
        "sql",
        "json",
        "markdown",
        "tsx",
        "hyprlang",
        "markdown_inline",
      },

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<cr>",
          node_incremental = "<cr>",
          scope_incremental = "<tab>",
          node_decremental = "<bs>",
        },
      },
    },

    config = function (_, opts) require ("nvim-treesitter.configs").setup (opts) end,
  },
}
