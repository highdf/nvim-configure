-- vim.fn.glob(_, )
-- vim.fn.glob()
-- vim.fn.glob()
return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
    },
    version = "*",
    event = "InsertEnter",

    opts = {
      keymap = {
        preset = "none",
        ["<C-y>"] = { "select_and_accept", "fallback" },

        ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
        ["<C-n>"] = { "select_next", "fallback_to_mappings" },

        ["<Tab>"] = { "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
      },

      appearance = {
        -- use_nvim_cmp_as_default = true,
        -- nerd_font_variant = "mono",
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

      snippets = { preset = "luasnip" },
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
          min_width = 20,
          max_height = 20,
          border = nil,
        },
        documentation = {},
      },
      signature = {
        enabled = false,
        window = { border = "single", show_documentation = false },
      },
    },
  },
}
-- signature.window.show_documentation = false
-- 在neovim中输入require()时会惮出一个signature，但我发现它不是出blink.cmp提供，那它是出谁产生的，我想关闭它
