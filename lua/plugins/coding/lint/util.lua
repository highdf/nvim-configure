local M = {}
local project_root_dir = vim.fs.joinpath (
  vim.fn.stdpath ("config"),
  "lua/plugins/coding/lint/config/projects"
)

M.project_path = function (project_name)
  return vim.fs.joinpath (project_root_dir, project_name)
end

return M
