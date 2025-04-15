return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },

  {
    "folke/tokyonight.nvim",
    priority = 1000,
  },

  {
    "nyoom-engineering/oxocarbon.nvim",
    name = "oxocarbon",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  },
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function ()
      require ("onedark").setup ({
        style = "dark",
      })
    end,
  },

  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },
}
