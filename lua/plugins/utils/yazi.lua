return {
  {
    "mikavilpas/yazi.nvim",
    version = "*",

    keys = {
      {
        "<leader>y",
        "<cmd>Yazi toggle<cr>",
        desc = "切换Yazi文件管理器",
      },
    },

    opts = {
      open_for_directories = false,
      yazi_floating_window_border = "rounded",
      floating_window_scaling_factor = 0.8,
    },

    -- config = function ()
    --   -- local yazi = require ("yazi")
    --   -- local pwd = vim.api.nvim_command ("pwd")
    --   -- -- yazi.toggle (pwd)
    -- end,
  },
}
