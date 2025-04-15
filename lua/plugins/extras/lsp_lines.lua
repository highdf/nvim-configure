return {
  "sontungexpt/better-diagnostic-virtual-text",
  event = "VeryLazy",
  opts = {
    ui = {
      wrap_line_after = true, -- wrap the line after this length to avoid the virtual text is too long
      above = false, -- the virtual text will be displayed above the line
    },
    inline = true,
  },
  config = function (_, opts)
    require ("better-diagnostic-virtual-text").setup (opts)
  end,
}
