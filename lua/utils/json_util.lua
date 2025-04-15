local M = {}

-- 使用 Neovim 内置的 JSON 处理功能
local vim_json = vim.json or (function()
  -- 对于较老版本的 Neovim，使用 vim.fn 中的 JSON 函数
  return {
    encode = function(tbl) return vim.fn.json_encode(tbl) end,
    decode = function(str) return vim.fn.json_decode(str) end
  }
end)()

-- 将JSON文件路径转换为table结构
function M.json_to_table(path)
    -- 检查路径是否有效
    if not path or type(path) ~= "string" then
        error("Invalid path provided: must be a non-empty string")
    end

    -- 使用io.open打开文件
    local file, err = io.open(path, "r")
    if not file then
        error("Failed to open file: " .. tostring(err))
    end

    -- 读取文件内容
    local content = file:read("*a")
    file:close()  -- 确保文件被关闭

    -- 检查内容是否为空
    if not content or content == "" then
        return nil
    end

    -- 使用Neovim内置的JSON解码功能
    local success, data = pcall(vim_json.decode, content)
    if not success then
        error("JSON decode error: " .. tostring(data))
    end

    return data
end

function M.json_format(json_content)
	if not json_content or type(json_content) ~= "string" then
		error("Invalid json_content provided: Must be a non-string")
	end

	if vim.fn.executable('jq') ~= 1 then 
		error("Command jq is Invalid")
	end

	local temp_name = vim.fn.tempname()
	local temp_file = io.open(temp_name, "w")

	if temp_file ~= nil then
		temp_file:write(json_content)
		temp_file:close()

		local formatted = vim.fn.system("jq . " .. temp_name)
		os.remove(temp_name)

		return formatted
	else
		error("Open file" .. temp_name .. " failed")
	end
end

-- 将table转换为JSON并写入文件
function M.table_to_file(tb, path)
    if not path or type(path) ~= "string" then
        error("Invalid path provided: must be a non-empty string")
    end

    if type(tb) ~= "table" then
        error("Invalid table provided: must be a table")
    end

    -- 使用Neovim内置的JSON编码功能
    local success, json_str = pcall(vim_json.encode, tb)
    if not success then
        error("JSON encode error: " .. tostring(json_str))
    end

    -- 写入文件
    local file, err = io.open(path, "w")
    if not file then
        error("Failed to open file for writing: " .. tostring(err))
    end

	json_str = M.json_format(json_str)
    file:write(json_str)
    file:close()
end


return M
