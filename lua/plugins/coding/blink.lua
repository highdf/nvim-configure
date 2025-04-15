return {
  {
    "saghen/blink.cmp",
    dependencies = { -- 依赖管理
      "rafamadriz/friendly-snippets",
      "echasnovski/mini.icons",
      version = "*",
    },
    version = "*",
    event = "InsertEnter",

    opts = {
      keymap = {
        preset = "default",
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },

      sources = {
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
          "lazydev",
        },

        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },

      cmdline = {
        enabled = false,
      },

      fuzzy = {
        implementation = "prefer_rust_with_warning",
      },

      completion = {
        accept = {
          auto_brackets = {
            enabled = true,
          },
        },
        menu = {
          min_width = 15,
          max_height = 20,
          winblend = 25,
          border = nil,
        },
        documentation = {
          window = { border = nil },
          auto_show = true, --
          auto_show_delay_ms = 100,
        },
      },
      signature = { window = { border = "single" } },
    },
  },
}
