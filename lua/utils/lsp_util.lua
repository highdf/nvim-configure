local lsp_util = {}
local tb_util = require('utils.table')
local json_util = require('utils.json_util')

local lsp_path = vim.fn.stdpath('config') .. '/lua/coding/lsp/'
local json_path = lsp_path .. 'config.json'
local config_dir_path = lsp_path .. "config/"
local config_reuqire_path = 'coding.lsp.config.'

lsp_util.lsp_path = lsp_path
lsp_util.json_path = json_path
lsp_util.config_dir_path = config_dir_path
lsp_util.cofig_require_path = config_reuqire_path

-- 将ft_tb中的每一项作为key, model_name作为value，添加到maps中
local function add_map_item(maps, ft_tb, model_name)
	for _, ft in pairs(ft_tb) do
		if not maps[ft] then
			maps[ft] = {}
		end
		table.insert(maps[ft], model_name)
	end

end

-- 判断tb中是否有值为value的项，tb是一个数组
local function in_table(tb, value)
	for _, item in ipairs(tb) do
		if item == value then
			return true
		end
	end

	return false
end

-- 更新cofig.json这个文件。
-- 这个文件中有两项分别为maps, ignore。
-- 其中ignore中记录了lsp_config_dir_path中哪些模块的ft表不需要使用add_map_item添加到maps项中。
-- maps项中记录了文件类型与相应语言服务器的映射关系
-- 最后将最新的config_tb转换为json_path中的json文件

function lsp_util.update_config_json()
	local files = tb_util.get_lua_files_glob(config_dir_path, "*.lua")
	local config_tb = lsp_util.json_table()

	if config_tb == nil then
		error("Get json_table failed")
	end

	local json_table = {}
	json_table.ignore = config_tb.ignore
	json_table.numbers = tb_util.get_table_size(files)
	json_table.maps = {}

	for _, file in ipairs(files) do
		local model_name = string.gsub(file, "%.lua", "")

		if not in_table(json_table.ignore, model_name) then
			local model = require('lsp.config.' .. model_name)
			local ft_tb = model.filetypes

			add_map_item(json_table.maps, ft_tb, model_name)
		end
	end

	json_util.table_to_file(json_table, json_path)
end

function lsp_util.get_config_number()
	local files =  tb_util.get_lua_files_glob(
		lsp_util.config_dir_path, "*.lua"
	)

	local number = tb_util.get_table_size(files)

	return number
end

function lsp_util.json_table()
	return json_util.json_to_table(lsp_util.json_path)
end

return lsp_util
