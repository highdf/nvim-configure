return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>?",
        function () require ("which-key").show ({ global = false }) end,
        desc = "Show all of key menu",
      },
    },

    opts = {
      preset = "helix",
    },

    config = function (_, opts)
      local wk = require ("which-key")
      wk.setup (opts)
    end,
  },
}
