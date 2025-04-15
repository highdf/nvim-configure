return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",

    keys = {
      {
        "<leader>tm",
        mode = "n",
        "<cmd>ToggleTerm name=float<cr>",
        desc = "Open term",
      },
      { "<A-q>", mode = "t", "<C-u>exit<cr>", desc = "Exit term" },
      { "<c-[>", mode = "t", "<C-\\><C-n>", desc = "back into normal mode" },
    },

    opts = {
      direction = "float",

      float_opts = {
        border = "double",
        width = 75,
        height = 20,
        winblend = 3,
        title_pos = "center",
      },

      responsiveness = {
        horizontal_breakpoint = 135,
      },
    },
  },
}
