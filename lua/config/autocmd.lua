-- 这里定义自动命令

-- 定时切换主题
local hour = tonumber(vim.fn.strftime("%H"))

-- tokyonight
-- if hour >= 6 and hour < 17 then
-- 	vim.cmd([[colorscheme tokyonight-day]])		-- light主题
-- 	-- options = { theme = 'tokyonight-day' }
-- else
-- 	vim.cmd([[colorscheme tokyonight-moon]])	-- dark主题
-- 	-- options = { theme = 'tokyonight-moon' }
-- end

-- catppuccin
if hour >= 6 and hour < 17 then
	vim.cmd([[colorscheme catppuccin-latte]])	-- light主题
	options = { theme = 'catppuccin-latte' }
else
	vim.cmd([[colorscheme catppuccin-mocha]])	-- dark主题
	options = { theme = 'catppuccin-mocha' }
end

-- 检查启动参数是否为目录
local function change_to_directory_if_provided()
  local arg = vim.fn.argv(0)  -- 获取第一个启动参数
  if arg and vim.fn.isdirectory(arg) == 1 then  -- 检查是否为目录
    vim.cmd("cd " .. vim.fn.fnameescape(arg))  -- 切换工作目录
  end
end

-- 在启动时调用函数
change_to_directory_if_provided()
