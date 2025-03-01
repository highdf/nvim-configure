-- 这里定义neovim的一些行为

------------------------------------
-- 设置编码
------------------------------------
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

------------------------------------
-- 基础设置
------------------------------------
vim.o.hlsearch = false				-- 取消当前搜索高亮
vim.o.scrolloff = 2					-- jk移动时光标下上方保留4行
vim.o.sidescrolloff = 2				-- jk移动时光标下下方保留4行
vim.wo.number = true				-- 显示行号
vim.wo.relativenumber = true		-- 使用相对行号
vim.wo.cursorline = true			-- 高亮所在行
vim.opt.tabstop = 4					-- 表示一个 Tab 显示出来的长度相当于 4 个空格
vim.opt.shiftwidth = 4				-- 自动缩进插入删除时所使用的空格数量
vim.opt.expandtab = false			-- 不展开 Tab 成为空格
vim.opt.mouse = ""					-- 移除所有类型的鼠标支持
vim.opt.autoindent = false			-- 开启自动缩进
vim.opt.smartindent = false			-- 开启智能缩进

-- vim.opt.mouse = "n"					-- 如果只是想保留某种模式下的鼠标支持，如普通模式
-- vim.opt.softtabstop = 4				-- 输入 <TAB> 键时实际插入的空格数目
-- vim.cmd("syntax on")					-- 打开语法高亮
-- vim.opt.wrap = false				-- 取消屏幕行折叠
-- vim.opt.termencoding = "utf-8"
-- vim.loader.enable()					-- 启用内置的模块加载，提高速度
