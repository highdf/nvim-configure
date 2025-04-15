return {
  {
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    event = "VeryLazy",

    config = function ()
      vim.keymap.set ({ "n", "i", "s" }, "<c-j>", function ()
        if not require ("noice.lsp").scroll (4) then return "<c-j>" end
      end, { silent = true, expr = true })

      vim.keymap.set ({ "n", "i", "s" }, "<c-k>", function ()
        if not require ("noice.lsp").scroll (-4) then return "<c-k>" end
      end, { silent = true, expr = true })
      require ("noice").setup ({
        presets = {
          bottom_search = false, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          signature = {
            enabled = true,
          },
        },
      })
    end,
  },
}
