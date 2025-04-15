-- TODO
return {
  s ({ trig = "fm", desc = "Insert current filename with extension" }, {
    f (function () return vim.fn.expand ("%:t") end),
  }),
  s ({ trig = "fr", desc = "Insert current filename without extension" }, {
    f (function () return vim.fn.expand ("%:t:r") end),
  }),
  s ({ trig = "fe", desc = "Insert current file extension" }, {
    f (function () return vim.fn.expand ("%:e") end),
  }),
  s ({ trig = "date", desc = "Insert current date and time" }, {
    f (function () return os.date () end),
  }),
  s ({ trig = "fp", desc = "Insert current file's full path" }, {
    f (function () return vim.fn.expand ("%:p") end),
  }),
}
