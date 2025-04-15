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
        desc = "显示通知历史",
      },

      -- 缓冲区操作
      {
        "<leader>bd",
        function () Snacks.bufdelete.delete () end,
        desc = "安全删除当前缓冲区",
      },
      {
        "<leader>bo",
        function () Snacks.bufdelete.other () end,
        desc = "删除其他缓冲区",
      },

      -- 版本控制
      {
        "<leader>sl",
        function () Snacks.lazygit.open () end,
        desc = "打开Lazygit面板",
      },

      -- 快速搜索导航
      {
        "<A-s>f",
        function () Snacks.picker.smart () end,
        desc = "智能文件搜索",
      },
      {
        "<A-s>b",
        function () Snacks.picker.buffers () end,
        desc = "缓冲区搜索",
      },
      {
        "<A-s>g",
        function () Snacks.picker.grep () end,
        desc = "全文内容搜索",
      },
      {
        "<A-s>h",
        function () Snacks.picker.command_history () end,
        desc = "命令历史搜索",
      },

      -- LSP智能导航
      {
        "gd",
        function () Snacks.picker.lsp_definitions () end,
        desc = "跳转定义",
      },
      {
        "gD",
        function () Snacks.picker.lsp_declarations () end,
        desc = "跳转声明",
      },
      {
        "gr",
        function () Snacks.picker.lsp_references () end,
        desc = "查看引用",
        nowait = true,
      },
      {
        "gl",
        function () Snacks.picker.lsp_implementations () end,
        desc = "跳转实现",
      },
      {
        "<leader>ps",
        function () Snacks.profiler.scratch () end,
        desc = "Profiler Scratch Bufer",
      },
      {
        "gt",
        function () Snacks.picker.lsp_type_definitions () end,
        desc = "类型定义",
      },
    },
  },
}
