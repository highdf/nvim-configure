-- 这里定义自动命令

local auto_cmd = {}

function auto_cmd.themes_switch ()
  local hour = tonumber (vim.fn.strftime ("%H"))

  local themes = {
    {
      light = "tokyonight-day",
      dark = "tokyonight-moon",
    },
    {
      light = "catppuccin-latte",
      dark = "catppuccin-mocha",
    },
    {
      light = "catppuccin-latte",
      dark = "oxocarbon",
    },
    {
      light = "onelight",
      dark = "onedark_vivid",
    },
  }

  local day = tonumber (vim.fn.getenv ("DAY_START"))
  local night = tonumber (vim.fn.getenv ("DAY_END"))
  local util = require ("utils.table")
  local table_size = util.get_table_size (themes)

  math.randomseed (os.time ())
  local random_index = math.random (1, table_size)
  local theme_switch_cmd = nil
  local background = nil

  if hour >= day and hour < night then
    background = "light"
    theme_switch_cmd = "colorscheme " .. themes[random_index].light
  else
    background = "dark"
    theme_switch_cmd = "colorscheme " .. themes[random_index].dark
  end

  vim.o.background = background
  vim.cmd (theme_switch_cmd)
end

auto_cmd.themes_switch ()
