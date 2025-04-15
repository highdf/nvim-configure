local M = {}

local lsp_util = require('utils.lsp_util')
local tb_util = require('utils.table')
local mason_util = require('utils.mason')
local enabled_cofig = {}

local function in_ignore_list(ignore_list, server_name)
	for _, ignore_item in ipairs(ignore_list) do
		if ignore_item == server_name then
			return true
		end
	end

	return false
end

local function init_config(config)
	local bin_path = mason_util.bin_path()

	if config.cmd == nil then
		error("Invalid config provided")
	end

	config.cmd[1] = bin_path .. config.cmd[1]
end

local function config_servers(server_names)
	for _, server_name in ipairs(server_names) do
		if enabled_cofig[server_name] == true then
			goto continue
		end

		local config = require('lsp.config.' .. server_name)

		if not config then
			error("Require config model failed")
		end

		local config_copy = vim.deepcopy(config)
		init_config(config_copy)

		vim.lsp.config(server_name, config_copy)
		vim.lsp.enable(server_name, true)

		enabled_cofig[server_name] = true

		::continue::
	end
end
local function is_update_config()
	local file_nmbers = tb_util.get_lua_files_glob(
		lsp_util.config_dir_path, "*.lua"
	)

	return file_nmbers ~= lsp_util.json_table().number
end


function M.load_lsp_config()
	-- 检查是否需要更新配置
	if is_update_config() == true then
		lsp_util.update_config_json()
	end


	-- 获取配置表
	local json_table = lsp_util.json_table()
	if not json_table or not json_table.maps then
		print("Warning: No LSP configuration found")
		return
	end

	-- 创建自动命令组，避免重复创建
	local group = vim.api.nvim_create_augroup("LSPAutoConfig", { clear = true })

	-- 添加文件打开事件监听器
	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		pattern = "*",
		callback = function(args)

			local ft = vim.bo[args.buf].filetype
			if not ft or ft == "" then
				return
			end

			-- 在json_table.maps中查找匹配的文件类型
			local server_names = json_table.maps[ft]
			if not server_names or #server_names == 0 then
				return
			end

			-- 为每个匹配的服务器配置并启动LSP
			config_servers(server_names)
		end
	})
end

function M.enable_lsp()
	local files = tb_util.get_lua_files_glob(lsp_util.config_dir_path, "*.lua")
	local ignore_list = {"jdtls"}

	for _, file in pairs(files) do
		local server_name = string.gsub(file, "%.lua", "")

		if not in_ignore_list(ignore_list, server_name) then
			local config = require(lsp_util.cofig_require_path .. server_name)

			init_config(config)
			vim.lsp.config(server_name, config)
			vim.lsp.enable(server_name, true)
		end
	end
end

M.enable_lsp()

return M
