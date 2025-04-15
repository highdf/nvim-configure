local config = {}
local utils_server = require ("utils.server")
local servers_path = vim.fs.joinpath (
  vim.fn.stdpath ("config"),
  "lua/plugins/coding/conform/config/servers"
)

config.log_level = vim.log.levels.DEBUG
config.formatters_by_ft, config.formatters =
  utils_server.generate_config (servers_path)

return config
