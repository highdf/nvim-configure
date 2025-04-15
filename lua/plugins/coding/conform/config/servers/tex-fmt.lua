local format_util = require ("plugins.coding.conform.util")

local config_name = "tex-fmt.toml"
local config_path = format_util.project_path (config_name)

local ft = {
  "text",
}

---@type conform.FileFormatterConfig
return {
  meta = {
    url = "https://github.com/WGUNDERWOOD/tex-fmt",
    description = "An extremely fast LaTeX formatter written in Rust.",
  },
  ft = ft,
  command = "tex-fmt",
  -- args = { "-s", "--config", config_path },
  args = { "-s", "--config=" .. config_path },
}
