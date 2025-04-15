-- 这里定义neovim的一些行为

------------------------------------
-- 设置编码
------------------------------------
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-----------------------------------------
-- 界面显示设置
-----------------------------------------
local scrlloff = 3
vim.o.hlsearch = false -- 完全禁用搜索高亮（不只是当前搜索）
vim.o.scrolloff = scrlloff -- 垂直滚动时保留的上下文行数（光标距离窗口顶部/底部 2 行时开始滚动）
vim.o.sidescrolloff = scrlloff -- 水平滚动时保留的上下文列数（光标距离窗口左右边缘 2 列时开始滚动）
vim.wo.number = true -- 显示绝对行号
vim.wo.relativenumber = true -- 显示相对行号（基于当前行的相对数值）
vim.wo.cursorline = true -- 高亮当前文本行（视觉焦点辅助）
vim.o.laststatus = 0 -- 关闭底部命令行

-----------------------------------------
-- 缩进与制表符设置
-----------------------------------------
local tab_size = 2

vim.opt.tabstop = tab_size -- 显示 Tab 字符为 4 个空格宽度
vim.opt.shiftwidth = tab_size -- 自动缩进/回退时的空格数（>> 和 << 命令）
vim.opt.expandtab = true -- 保留 Tab 字符（不转换为空格），适合需要严格 Tab 的场景
vim.opt.autoindent = false -- 禁用自动继承上一行缩进
vim.opt.smartindent = false -- 禁用智能缩进（例如代码块自动缩进）
vim.opt.cindent = false -- 禁用 C 语言风格自动缩进

-----------------------------------------
-- 其他设置
-----------------------------------------
vim.opt.mouse = "" -- 完全禁用鼠标支持（包括所有模式：n/v/i/c 等）
vim.o.termguicolors = true -- 启用真彩色支持（需要终端支持）
vim.opt.ignorecase = true -- 忽略大小写搜索
vim.opt.smartcase = true -- 开启智能搜索
vim.g.copilot_no_tab_map = true

-----------------------------------------
--- 可选项
-----------------------------------------
-- vim.opt.errorformat = ""      -- 清空错误格式匹配（会禁用 quickfix 解析，慎用！）
-- vim.opt.mouse = "n"					-- 如果只是想保留某种模式下的鼠标支持，如普通模式
-- vim.opt.softtabstop = 4				-- 输入 <TAB> 键时实际插入的空格数目
-- vim.cmd("syntax on")					-- 打开语法高亮
-- vim.opt.wrap = false					-- 取消屏幕行折叠
-- vim.loader.enable()					-- 启用内置的模块加载，提高速度
-- vim.cmd[[filetype indent off]] 		-- 关闭文件类型相关的缩进规则
