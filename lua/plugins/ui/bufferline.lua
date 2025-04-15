return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      { "nvim-tree/nvim-web-devicons", lazy = true },
    },
    event = "VeryLazy",

    init = function () vim.opt.termguicolors = true end,

    config = function ()
      require ("bufferline").setup ({
        options = {
          themable = true,
          diagnostics = "nvim_lsp",
          color_icons = true,
          show_buffer_close_icons = false,
          show_tab_indicators = true,
          show_close_icon = false,
          diagnostics_indicator = function (count, level)
            local icon = level:match ("error") and " " or " "
            return " " .. icon .. count
          end,
        },
      })
    end,
  },
}
