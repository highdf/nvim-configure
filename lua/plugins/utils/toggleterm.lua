return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",

    keys = {
      {
        "<leader>tm",
        mode = "n",
        "<cmd>ToggleTerm name=float<cr>",
        desc = "打开浮动终端",
      },
      { "<A-q>", mode = "t", "<C-u>exit<cr>", desc = "关闭终端窗口" },
      { "<c-[>", mode = "t", "<C-\\><C-n>", desc = "返回普通模式" },
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
