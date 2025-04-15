local tb_util = {}

function tb_util.get_table_size (tb)
  local const = 0

  for key, value in pairs (tb) do
    const = const + 1
  end

  return const
end

function tb_util.get_lua_files_glob (path, glob_str)
  local files = vim.fn.globpath (path, glob_str, false, true)
  local filenames = {}

  for _, file in ipairs(files) do
    local filename = vim.fn.fnamemodify (file, ":t")
    table.insert (filenames, filename)
  end

  return filenames
end

return tb_util
