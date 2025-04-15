return {
  {
    "folke/ts-comments.nvim",
    event = "VeryLazy",
    dependencies = {
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        lazy = true,
      },
    },

    config = true,
  },
}
