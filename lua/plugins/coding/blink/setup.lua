local config = {}

config.keymap = {
  preset = "none",
  ["<C-y>"] = { "select_and_accept", "fallback" },

  ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
  ["<C-n>"] = { "select_next", "fallback_to_mappings" },

  ["<Tab>"] = { "snippet_forward", "fallback" },
  ["<S-Tab>"] = { "snippet_backward", "fallback" },
}

config.appearance = {
  nerd_font_variant = "mono",
}

config.cmdline = { enabled = false }

config.sources = {
  default = {
    "lsp",
    "path",
    "snippets",
    "buffer",
  },

  per_filetype = {
    sql = { "snippets", "dadbod", "buffer" },
    lua = { inherit_defaults = true, "lazydev" },
  },

  providers = {
    dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
    lazydev = {
      name = "LazyDev",
      module = "lazydev.integrations.blink",
      score_offset = 100,
    },
  },
}

config.snippets = { preset = "luasnip" }

config.fuzzy = {
  implementation = "prefer_rust_with_warning",
}

config.completion = {
  accept = {
    auto_brackets = {
      enabled = true,
    },
  },
  menu = {
    min_width = 10,
    max_height = 5,
    border = "none",
    draw = {},
  },
  documentation = { auto_show = true, auto_show_delay_ms = 100 },
}

config.signature = {
  enabled = false,
  window = { border = "none", show_documentation = false },
}

return config
