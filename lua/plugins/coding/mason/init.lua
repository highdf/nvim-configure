return {
  {
    "mason-org/mason.nvim",
    event = "VeryLazy",

    keys = {
      {
        "<leader>ma",
        mode = "n",
        "<cmd>Mason<CR>",
        desc = "Open mason manager",
      },
    },

    config = function ()
      -- 只有先配置后，mason-registry的api才生效
      local setup = require ("plugins.coding.mason.setup")
      require ("mason").setup (setup)
      local util = require ("plugins.coding.mason.util")
      util.sync_data ()
    end,
  },
}
