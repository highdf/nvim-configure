local M = {}

M.project_path = function (project_name)
  local prefix_path = vim.fs.joinpath (
    vim.fn.stdpath ("config"),
    "lua/plugins/coding/conform/config/projects"
  )
  return vim.fs.joinpath (prefix_path, project_name)
end

return M
