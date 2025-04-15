return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
    },
    version = "*",
    event = "InsertEnter",

    opts = function () return require ("plugins.coding.blink.setup") end,
  },
}
