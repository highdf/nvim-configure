-- TODO
return {
  s ("fn", {
    f (function () return vim.fn.expand ("%:t") end),
  }),
  s ("fb", {
    f (function () return vim.fn.expand ("%:t:r") end),
  }),
  s ("fe", {
    f (function () return vim.fn.expand ("%:e") end),
  }),
  s ("date", {
    f (function () return os.date () end),
  }),
  s ("fp", {
    f (function () return vim.fn.expand ("%:p") end),
  }),
}
