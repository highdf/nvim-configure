return {
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      {
        "kristijanhusak/vim-dadbod-completion",
        ft = { "sql", "mysql", "plsql" },
        lazy = true,
      }, -- Optional
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },

    keys = {
      { "<leader>db", mode = "n", "<cmd>DBUIToggle<cr>", desc = "Toggle DBUI" },
    },

    init = function ()
      vim.gdb_ui_use_nerd_fnts = 1
      vim.g.dbs = {
        {
          name = "dev",
          url = "postgresql://postgres:275365@localhost:5432/store",
        },
      }
    end,
  },
}
