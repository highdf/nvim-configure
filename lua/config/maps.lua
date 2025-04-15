---这里定义了以下快捷键

------------------------------------
-- 起始设置
------------------------------------
vim.g.mapleader = "\\"               -- 定义全局 Leader 键（推荐使用空格键替代）
vim.g.maplocalleader = "\\"          -- 定义本地 Leader 键（保留相同配置）
local map = vim.api.nvim_set_keymap  -- 简化 API 调用
local opt = { noremap = true, silent = true }  -- 定义通用映射选项

-----------------------------------------
-- [文件与目录操作]
-----------------------------------------
-- 切换工作目录到当前文件所在目录（替代 :cd %:p:h）
map('n', '<leader>%', '<cmd>cd %:p:h<cr>', opt)

-----------------------------------------
-- [文本转换操作]
-----------------------------------------
-- 插入模式快速大小写转换（需光标位于单词中间）
map('i', '<C-b>', '<C-[>gUawA', opt)  -- 转大写（建议改用 <C-u> 标准操作）
map('i', '<C-s>', '<C-[>guawA', opt)  -- 转小写（可能覆盖保存快捷键）

-----------------------------------------
-- [插件管理系统]
-----------------------------------------
map('n', '<leader>lz', '<cmd>Lazy<cr>', opt)  -- 打开 Lazy.nvim 插件管理界面

-----------------------------------------
-- [代码结构操作]
-----------------------------------------
map('n', '<leader>(', 'ci(', opt)    -- 修改圆括号内容
map('n', '<leader>[', 'ci[', opt)    -- 修改方括号内容
map('n', '<leader>{', 'ci{', opt)    -- 修改花括号内容
map('n', "<leader>'", "ci'", opt)    -- 修改单引号内容
map('n', '<leader>"', 'ci"', opt)    -- 修改双引号内容
map('n', '<leader><', 'ci<', opt)    -- 修改尖括号内容

-----------------------------------------
-- [参数列表管理]
-----------------------------------------
map('n', '<leader>ag', ':args ', opt)       -- 手动指定文件参数（需输入参数）
map('n', '<leader>aa', ':argadd ', opt)     -- 追加文件到参数列表
map('n', '<leader>al', '<cmd>args<enter>', opt)  -- 显示当前参数列表
map('n', '<leader>an', '<cmd>next<enter>', opt)  -- 跳转下一个参数文件
map('n', '<leader>ap', '<cmd>prev<enter>', opt)  -- 跳转上一个参数文件

-----------------------------------------
-- [标签页管理]
-----------------------------------------
map('n', '<leader>tt', '<cmd>tabnew<enter>', opt)  -- 新建标签页
map('n', '<leader>to', '<cmd>tabonly<enter>', opt) -- 关闭其他标签页
map('n', '<leader>tc', '<cmd>tabclose<enter>', opt)-- 关闭当前标签页
map('n', '<leader>tn', '<cmd>tabnext<enter>', opt) -- 下一标签页
map('n', '<leader>tp', '<cmd>tabprev<enter>', opt) -- 上一标签页

-----------------------------------------
-- [寄存器操作]
-----------------------------------------
-- 普通模式
map('n','<leader>0','"0p',opt)
map('n','<leader>1','"1p',opt)
map('n','<leader>2','"2p',opt)
map('n','<leader>3','"3p',opt)
map('n','<leader>4','"4p',opt)
map('n','<leader>5','"5p',opt)
map('n','<leader>6','"6p',opt)
map('n','<leader>7','"7p',opt)
map('n','<leader>8','"8p',opt)
map('n','<leader>9','"9p',opt)
map('n','<leader>+','o<C-[>"+p',opt)
-- 可视模式
map('v','<leader>0','"0p',opt)
map('v','<leader>1','"1p',opt)
map('v','<leader>2','"2p',opt)
map('v','<leader>3','"3p',opt)
map('v','<leader>4','"4p',opt)
map('v','<leader>5','"5p',opt)
map('v','<leader>6','"6p',opt)
map('v','<leader>7','"7p',opt)
map('v','<leader>8','"8p',opt)
map('v','<leader>9','"9p',opt)

-----------------------------------------
-- [构建系统集成]
-----------------------------------------
map('n', '<leader>mk', '<cmd>wa | make<cr>', opt)      -- 保存后执行 make（建议异步处理）
map('n', '<leader>Mk', '<cmd>argadd Makefile | edit Makefile<cr>', opt)  -- 快速编辑 Makefile

-----------------------------------------
-- [缓冲区管理]
-----------------------------------------
map('n', '<leader>bn', '<cmd>bn<cr>', opt)  -- 下一缓冲区（推荐使用 :bnext）
map('n', '<leader>bp', '<cmd>bp<cr>', opt)  -- 上一缓冲区（推荐使用 :bprev）
map('n', '<leader>bl', '<cmd>ls<cr>', opt)  -- 列出所有缓冲区（推荐使用 telescope）
map('n', '<leader>bf', '<cmd>bf<cr>', opt)  -- 跳转首缓冲区（可能不直观）
map('n', '<leader>be', '<cmd>bl<cr>', opt)  -- 跳转尾缓冲区（可能不直观）

-----------------------------------------
-- [系统剪贴板集成]
-----------------------------------------
map('v', '<A-v>', '"+p', opt)  -- 粘贴系统剪贴板（推荐使用 <leader>p）
map('v', '<A-c>', '"+y', opt)  -- 复制到系统剪贴板（推荐使用 <leader>y）

-----------------------------------------
-- [窗口管理]
-----------------------------------------
map('n','<A-h>','<C-w>h', opt)  -- 聚焦左窗口
map('n','<A-j>','<C-w>j', opt)  -- 聚焦下窗口
map('n','<A-k>','<C-w>k', opt)  -- 聚焦上窗口
map('n','<A-l>','<C-w>l', opt)  -- 聚焦右窗口
map('n','<A-o>','<C-w>o', opt)  -- 关闭其他窗口（保留当前）
map('n','<A-c>','<C-w>c', opt)  -- 关闭当前窗口
-----------------------------------------
-- [其他操作]
-----------------------------------------
map("n", "<leader><leader>", "o<C-[>k", opt)
map("i", "<C-]>", " {<cr>}<C-o>O", opt)
