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
        highlight = "Directory",
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
              highlight = "NormalNC",
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
-- {
--     highlights = {
--         fill = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         background = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         tab = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         tab_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         tab_separator = {
--           fg = '<colour-value-here>',
--           bg = '<colour-value-here>',
--         },
--         tab_separator_selected = {
--           fg = '<colour-value-here>',
--           bg = '<colour-value-here>',
--           sp = '<colour-value-here>',
--           underline = '<colour-value-here>',
--         },
--         tab_close = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         close_button = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         close_button_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         close_button_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         buffer_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         buffer_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             bold = true,
--             italic = true,
--         },
--         numbers = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         numbers_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         numbers_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             bold = true,
--             italic = true,
--         },
--         diagnostic = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         diagnostic_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         diagnostic_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             bold = true,
--             italic = true,
--         },
--         hint = {
--             fg = '<colour-value-here>',
--             sp = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         hint_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         hint_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             sp = '<colour-value-here>',
--             bold = true,
--             italic = true,
--         },
--         hint_diagnostic = {
--             fg = '<colour-value-here>',
--             sp = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         hint_diagnostic_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         hint_diagnostic_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             sp = '<colour-value-here>',
--             bold = true,
--             italic = true,
--         },
--         info = {
--             fg = '<colour-value-here>',
--             sp = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         info_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         info_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             sp = '<colour-value-here>',
--             bold = true,
--             italic = true,
--         },
--         info_diagnostic = {
--             fg = '<colour-value-here>',
--             sp = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         info_diagnostic_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         info_diagnostic_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             sp = '<colour-value-here>',
--             bold = true,
--             italic = true,
--         },
--         warning = {
--             fg = '<colour-value-here>',
--             sp = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         warning_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         warning_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             sp = '<colour-value-here>',
--             bold = true,
--             italic = true,
--         },
--         warning_diagnostic = {
--             fg = '<colour-value-here>',
--             sp = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         warning_diagnostic_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         warning_diagnostic_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             sp = '<colour-value-here>',
--             bold = true,
--             italic = true,
--         },
--         error = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             sp = '<colour-value-here>',
--         },
--         error_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         error_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             sp = '<colour-value-here>',
--             bold = true,
--             italic = true,
--         },
--         error_diagnostic = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             sp = '<colour-value-here>',
--         },
--         error_diagnostic_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         error_diagnostic_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             sp = '<colour-value-here>',
--             bold = true,
--             italic = true,
--         },
--         modified = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         modified_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         modified_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         duplicate_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             italic = true,
--         },
--         duplicate_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             italic = true,
--         },
--         duplicate = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             italic = true,
--         },
--         separator_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         separator_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         separator = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         indicator_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         indicator_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         pick_selected = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             bold = true,
--             italic = true,
--         },
--         pick_visible = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             bold = true,
--             italic = true,
--         },
--         pick = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--             bold = true,
--             italic = true,
--         },
--         offset_separator = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         },
--         trunc_marker = {
--             fg = '<colour-value-here>',
--             bg = '<colour-value-here>',
--         }
--     };
-- }
