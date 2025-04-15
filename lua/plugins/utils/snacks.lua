return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    opts = {
      indent = { enabled = true },
      notifier = { enabled = true },
      scroll = { enabled = true },

      bufdelete = { enabled = true },
      lazygit = { enabled = true },
      image = { enabled = true },

      picker = { enabled = true },
    },

    keys = {
      {
        "<leader>sn",
        function () Snacks.notifier.show_history () end,
        desc = "Show notification history",
      },

      -- Buffer operations
      {
        "<leader>bd",
        function () Snacks.bufdelete.delete () end,
        desc = "Safely delete current buffer",
      },
      {
        "<leader>bo",
        function () Snacks.bufdelete.other () end,
        desc = "Delete other buffers",
      },

      -- Version control
      {
        "<leader>sl",
        function () Snacks.lazygit.open () end,
        desc = "Open Lazygit panel",
      },

      -- Quick search navigation
      {
        "<A-s>f",
        function () Snacks.picker.smart () end,
        desc = "Smart file search",
      },
      {
        "<A-s>b",
        function () Snacks.picker.buffers () end,
        desc = "Buffer search",
      },
      {
        "<A-s>g",
        function () Snacks.picker.grep () end,
        desc = "Full text search",
      },
      {
        "<A-s>h",
        function () Snacks.picker.command_history () end,
        desc = "Command history search",
      },

      -- LSP smart navigation
      {
        "gd",
        function () Snacks.picker.lsp_definitions () end,
        desc = "Go to definition",
      },
      {
        "gD",
        function () Snacks.picker.lsp_declarations () end,
        desc = "Go to declaration",
      },
      {
        "gr",
        function () Snacks.picker.lsp_references () end,
        desc = "Find references",
        nowait = true,
      },
      {
        "gl",
        function () Snacks.picker.lsp_implementations () end,
        desc = "Go to implementation",
      },
      {
        "<leader>ps",
        function () Snacks.profiler.scratch () end,
        desc = "Profiler Scratch Buffer",
      },
      {
        "gt",
        function () Snacks.picker.lsp_type_definitions () end,
        desc = "Go to type definition",
      },
    },
  },
}
