local function get_lua_files_glob()
    local path = vim.fn.stdpath('config') .. '/lua/lsp/config'
    -- 使用 globpath 获取所有 .lua 文件
    local files_str = vim.fn.globpath(path, '*.lua')
    
    -- 将字符串转换为表
    local files = {}
    for file in string.gmatch(files_str, '([^\n]+)') do
        -- 只提取文件名（去除路径）
        local filename = vim.fn.fnamemodify(file, ':t')
        table.insert(files, filename)
    end
    
    return files
end

function is_contains(file, files) 
	local ret = false

	for _, file_name in pairs(files) do
		if file_name == file then
			ret = true
			break
		end
	end

	return ret
end

-- 使用示例
local lua_files = get_lua_files_glob()
local igore_files = {
	"jdtls.lua"
}

for _, file in ipairs(lua_files) do
	local jump = is_contains(file, igore_files)

	if (jump == false) then
		local server = file:gsub("%.lua", "")
		local config = require("lsp.config." .. server)
		vim.lsp.config(server, config)
		vim.lsp.enable(server)
	end
end
