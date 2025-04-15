return {
  {
    "NyxVim/nvim-colorizer.lua",
    event = "VeryLazy",

    opts = {
      filetypes = {
        "html",
        "css",
        "conf",
        "javascript",
        "typescript",
        lua = {
          RGB = true,
          RRGGBB = true,
          names = false,
          mode = "virtualtext",
        },
        python = {
          RGB = true,
          RRGGBB = true,
          names = true,
          css_fn = true,
          mode = "background",
        },
      },
      user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = true,
        RRGGBBAA = false,
        AARRGGBB = false,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
        mode = "virtualtext",
        tailwind = false,
        sass = { enable = false, parsers = { "css" } },
        virtualtext = "",
        always_update = false,
      },
      buftypes = {},
    },

    config = function (_, opts) require ("colorizer").setup (opts) end,
  },
}
