return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
    },

    keys = function () return require ("plugins.coding.dap.keys").dap_keys end,

    config = function ()
      local dap_util = require ("plugins.coding.dap.util")
      dap_util.require_configs ()
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    lazy = true,

    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },

    keys = function () return require ("plugins.coding.dap.keys").dap_ui_keys end,

    opts = function () return require ("plugins.coding.dap.setup.dap-ui") end,
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = true,

    opts = function () return require ("plugins.coding.dap.setup.dap-text") end,
  },
}
