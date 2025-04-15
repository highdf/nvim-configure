-- 这里定义自动命令

-- 定时切换主题
local auto_cmd = {}

function auto_cmd.themes_switch()
	local hour = tonumber(vim.fn.strftime("%H"))

	local themes = {
		{
			light = "tokyonight-day",
			dark = "tokyonight-moon",
		},
		{
			light = "catppuccin-latte",
			dark = "catppuccin-mocha",
		}
	}

	local util = require("utils.table")
	local table_size = util.get_table_size(themes)

	math.randomseed(os.time())
	local random_index = math.random(1, table_size)
	local theme_switch_cmd = nil

	if hour >= 7 and hour < 17 then
		theme_switch_cmd = "colorscheme " .. themes[random_index].light
	else
		theme_switch_cmd = "colorscheme " .. themes[random_index].dark
	end

	vim.cmd(theme_switch_cmd)
end

function auto_cmd.dir_change()
	local arg = vim.fn.argv(0)  -- 获取第一个启动参数
	if arg and vim.fn.isdirectory(arg) == 1 then  -- 检查是否为目录
		vim.cmd("cd " .. vim.fn.fnameescape(arg))  -- 切换工作目录
	end
end


auto_cmd.dir_change()
auto_cmd.themes_switch()
