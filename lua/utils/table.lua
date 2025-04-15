local tb_util = {}

function tb_util.get_table_size(tb)
	local const = 0

	for key, value in pairs(tb) do
		const = const + 1
	end

	return const
end

function tb_util.get_lua_files_glob(path, glob_str)
    -- 使用 globpath 获取所有 .lua 文件
    local files_str = vim.fn.globpath(path, glob_str)
    -- 将字符串转换为表
    local files = {}
    for file in string.gmatch(files_str, '([^\n]+)') do
        -- 只提取文件名（去除路径）
        local filename = vim.fn.fnamemodify(file, ':t')
        table.insert(files, filename)
    end

    return files
end

return tb_util
