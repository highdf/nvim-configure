local loader = require ("luasnip.loaders.from_lua")
local luasnip = require ("luasnip")
local snacks_picker = require ("snacks.picker")
local path = vim.fs.joinpath (
  vim.fn.stdpath ("config"),
  "/lua/plugins/coding/luasnip/snippets"
)
local config = {}

vim.keymap.set ({ "s", "i" }, "<C-s>", function ()
  if luasnip.choice_active () then
    local choices = luasnip.get_current_choices ()
    vim.ui.select (
      choices,
      { prompt = "select" },
      function (_, index) luasnip.set_choice (index) end
    )
  end
end)

loader.load ({ paths = path })

return config
