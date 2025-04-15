return {
  {
    "mikavilpas/yazi.nvim",
    version = "*",

    opts = {
      open_for_directories = false,
      yazi_floating_window_border = "rounded",
      floating_window_scaling_factor = 0.8,
      future_features = {
        use_cwd_file = false,
      },
    },

    keys = {
      {
        "<leader>y",
        function (_, opts) require ("yazi").yazi (opts, vim.fn.expand ("%:p")) end,
        desc = "Open yazi file manager",
      },
    },
  },
}
