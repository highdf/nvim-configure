return {
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "VeryLazy",

    config = function ()
      require ("lsp_lines").setup ({
        highlight_hovered_item = true,
        show_diagnostic_source = true,
      })

      vim.diagnostic.config ({
        virtual_text = false,
        virtual_lines = {
          only_current_line = true,
          highlight_whole_line = false,
        },
        underline = true,
        signs = true,
        update_in_insert = false,
      })
    end,
  },
}
