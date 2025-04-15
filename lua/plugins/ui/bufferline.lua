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
      local bg = {
        attribute = "bg",
        highlight = "TabLine",
      }
      local fg = {
        attribute = "fg",
        highlight = "NonText",
      }
      local main_bg = {
        attribute = "bg",
        highlight = "NormalNC",
      }
      local main_fg = {
        attribute = "fg",
        highlight = "Title",
      }

      require ("bufferline").setup ({
        options = {
          diagnostics = "nvim_lsp",
          color_icons = true,
          show_buffer_close_icons = false,
          show_tab_indicators = true,
          show_close_icon = false,
          diagnostics_indicator = function (count, level)
            local icon = level:match ("error") and " " or " "
            return " " .. icon .. count
          end,
          indicator = {
            style = "none",
          },
          separator_style = "slant",
        },
        highlights = {
          fill = {
            bg = bg,
          },
          background = {
            fg = fg,
            bg = bg,
          },
          buffer_selected = {
            fg = main_fg,
            bg = main_bg,
            bold = true,
            italic = true,
          },
          separator = {
            fg = bg,
            bg = bg,
          },
          separator_selected = {
            fg = bg,
            bg = main_bg,
          },
          hint_selected = {
            bg = main_bg,
          },
          hint_diagnostic_visible = {
            bg = bg,
          },
          hint_diagnostic_selected = {
            bg = main_bg,
          },
          info_selected = {
            bg = main_bg,
          },
          info_diagnostic_visible = {
            bg = bg,
          },
          info_diagnostic_selected = {
            bg = main_bg,
          },
          warning_diagnostic_visible = {
            bg = bg,
          },
          warning_selected = {
            bg = main_bg,
          },
          warning_diagnostic_selected = {
            bg = main_bg,
          },
          error_selected = {
            bg = main_bg,
          },
          error_diagnostic_visible = {
            bg = bg,
          },
          error_diagnostic_selected = {
            bg = main_bg,
          },
          modified_visible = {
            bg = bg,
          },
          modified_selected = {
            bg = main_bg,
          },

          tab = {
            fg = fg,
            bg = bg,
          },
          tab_selected = {
            fg = main_fg,
            bg = main_bg,
          },
          tab_separator = {
            fg = bg,
            bg = bg,
          },
          tab_separator_selected = {
            fg = bg,
            bg = main_bg,
          },

          trunc_marker = {
            fg = {
              attribute = "fg",
              highlight = "Normal",
            },
            bg = {
              attribute = "bg",
              highlight = "TabLineFill",
            },
          },
          -- indicator_visible = {
          --   -- fg = "<colour-value-here>",
          --   bg = "#1f1f1f",
          -- },
          -- indicator_selected = {
          --   -- fg = "<colour-value-here>",
          --   bg = "#4f3fff",
          -- },
          -- duplicate_selected = {
          --   -- fg = "<colour-value-here>",
          --   bg = "#6f6fef",
          --   italic = true,
          -- },
          -- duplicate_visible = {
          --   -- fg = "<colour-value-here>",
          --   bg = "#234fff",
          --   italic = true,
          -- },
        },
      })
    end,
  },
}
