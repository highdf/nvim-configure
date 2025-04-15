local M = {}
local utils_server = require ("utils.server")
local servers_path = vim.fs.joinpath (
  vim.fn.stdpath ("config"),
  "lua/plugins/coding/lint/config/servers"
)

M.linters_by_ft, M.linters = utils_server.generate_config (servers_path)

return M
