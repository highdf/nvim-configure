return {
  {
    "rmagatti/auto-session",
    lazy = false,
    keys = {
      {
        "<A-s>s",
        "<cmd>AutoSession search<CR>",
        desc = "Session search",
      },
    },

    init = function ()
      vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,"
        .. "localoptions"
    end,
    config = true,
  },
}
