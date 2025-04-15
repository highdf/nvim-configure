---这里定义了以下快捷键

------------------------------------
-- 起始设置
------------------------------------
vim.g.mapleader = "\\"               -- 定义全局 Leader 键
vim.g.maplocalleader = "\\"          -- 定义本地 Leader 键
local map = vim.keymap.set           -- 使用支持 desc 的新 API
local opt = { noremap = true, silent = true }  -- 基础选项

-----------------------------------------
-- [文件与目录操作]
-----------------------------------------
map('n', '<leader>%', '<cmd>cd %:p:h<cr>', vim.tbl_extend('force', opt, {
  desc = "切换工作目录到当前文件所在位置"
}))

-----------------------------------------
-- [文本转换操作]
-----------------------------------------
map('i', '<C-b>', '<C-[>gUawA', vim.tbl_extend('force', opt, {
  desc = "将当前单词转为大写（退出插入模式）"
}))
map('i', '<C-s>', '<C-[>guawA', vim.tbl_extend('force', opt, {
  desc = "将当前单词转为小写（退出插入模式）"
}))

-----------------------------------------
-- [插件管理系统]
-----------------------------------------
map('n', '<leader>lz', '<cmd>Lazy<cr>', vim.tbl_extend('force', opt, {
  desc = "打开 Lazy.nvim 插件管理器"
}))

-----------------------------------------
-- [代码结构操作]
-----------------------------------------
local change_inside = function(key, description)
  map('n', '<leader>' .. key, 'ci' .. key, vim.tbl_extend('force', opt, {
    desc = "修改" .. description .. "内的内容"
  }))
end

change_inside('(', '圆括号')
change_inside('[', '方括号')
change_inside('{', '花括号')
change_inside("'", "单引号")
change_inside('"', '双引号')
change_inside('<', '尖括号')

-----------------------------------------
-- [参数列表管理]
-----------------------------------------
map('n', '<leader>ag', ':args ', vim.tbl_extend('force', opt, {
  desc = "手动指定参数列表（输入文件模式）"
}))
map('n', '<leader>aa', ':argadd ', vim.tbl_extend('force', opt, {
  desc = "追加文件到参数列表"
}))
map('n', '<leader>al', '<cmd>args<cr>', vim.tbl_extend('force', opt, {
  desc = "显示当前参数列表"
}))
map('n', '<leader>an', '<cmd>next<cr>', vim.tbl_extend('force', opt, {
  desc = "跳转到下一个参数文件"
}))
map('n', '<leader>ap', '<cmd>prev<cr>', vim.tbl_extend('force', opt, {
  desc = "跳转到上一个参数文件"
}))

-----------------------------------------
-- [标签页管理]
-----------------------------------------
map('n', '<leader>tt', '<cmd>tabnew<cr>', vim.tbl_extend('force', opt, {
  desc = "创建新标签页"
}))
map('n', '<leader>to', '<cmd>tabonly<cr>', vim.tbl_extend('force', opt, {
  desc = "关闭除当前标签页外的所有标签页"
}))
map('n', '<leader>tc', '<cmd>tabclose<cr>', vim.tbl_extend('force', opt, {
  desc = "关闭当前标签页"
}))
map('n', '<leader>tn', '<cmd>tabnext<cr>', vim.tbl_extend('force', opt, {
  desc = "切换到下一个标签页"
}))
map('n', '<leader>tp', '<cmd>tabprev<cr>', vim.tbl_extend('force', opt, {
  desc = "切换到上一个标签页"
}))

-----------------------------------------
-- [寄存器操作]
-----------------------------------------
-- 普通模式寄存器粘贴
local reg_map_normal = function(num)
  map('n', '<leader>' .. num, '"' .. num .. 'p', vim.tbl_extend('force', opt, {
    desc = "粘贴寄存器 " .. num .. " 的内容"
  }))
end

-- 可视模式寄存器粘贴
local reg_map_visual = function(num)
  map('v', '<leader>' .. num, '"' .. num .. 'p', vim.tbl_extend('force', opt, {
    desc = "用寄存器 " .. num .. " 的内容替换选中文本"
  }))
end

-- 创建寄存器映射（0-9）
for i = 0, 9 do
  reg_map_normal(tostring(i))
  reg_map_visual(tostring(i))
end

-- 特殊粘贴操作
map('n', '<leader>+', 'o<Esc>"+p', vim.tbl_extend('force', opt, {
  desc = "新建行并粘贴系统剪贴板内容"
}))

-----------------------------------------
-- [构建系统集成]
-----------------------------------------
map('n', '<leader>mk', '<cmd>wa | make<cr>', vim.tbl_extend('force', opt, {
  desc = "保存所有文件并执行 make 命令"
}))
map('n', '<leader>Mk', '<cmd>argadd Makefile | edit Makefile<cr>', vim.tbl_extend('force', opt, {
  desc = "添加并编辑 Makefile 文件"
}))

-----------------------------------------
-- [缓冲区管理]
-----------------------------------------
map('n', '<leader>bn', '<cmd>bn<cr>', vim.tbl_extend('force', opt, {
  desc = "切换到下一个缓冲区"
}))
map('n', '<leader>bp', '<cmd>bp<cr>', vim.tbl_extend('force', opt, {
  desc = "切换到上一个缓冲区"
}))
map('n', '<leader>bl', '<cmd>ls<cr>', vim.tbl_extend('force', opt, {
  desc = "列出所有缓冲区"
}))
map('n', '<leader>bf', '<cmd>bf<cr>', vim.tbl_extend('force', opt, {
  desc = "切换到第一个缓冲区"
}))
map('n', '<leader>be', '<cmd>bl<cr>', vim.tbl_extend('force', opt, {
  desc = "切换到最后一个缓冲区"
}))

-----------------------------------------
-- [系统剪贴板集成]
-----------------------------------------
map('v', '<A-v>', '"+p', vim.tbl_extend('force', opt, {
  desc = "粘贴系统剪贴板内容到选中区域"
}))
map('v', '<A-c>', '"+y', vim.tbl_extend('force', opt, {
  desc = "复制选中内容到系统剪贴板"
}))

-----------------------------------------
-- [窗口管理]
-----------------------------------------
map('n', '<A-h>', '<C-w>h', vim.tbl_extend('force', opt, {
  desc = "聚焦左侧窗口"
}))
map('n', '<A-j>', '<C-w>j', vim.tbl_extend('force', opt, {
  desc = "聚焦下方窗口"
}))
map('n', '<A-k>', '<C-w>k', vim.tbl_extend('force', opt, {
  desc = "聚焦上方窗口"
}))
map('n', '<A-l>', '<C-w>l', vim.tbl_extend('force', opt, {
  desc = "聚焦右侧窗口"
}))
map('n', '<A-o>', '<C-w>o', vim.tbl_extend('force', opt, {
  desc = "关闭其他窗口（仅保留当前窗口）"
}))
map('n', '<A-c>', '<C-w>c', vim.tbl_extend('force', opt, {
  desc = "关闭当前窗口"
}))

-----------------------------------------
-- [其他操作]
-----------------------------------------
map("n", "<leader><leader>", "o<C-[>k", vim.tbl_extend('force', opt, {
  desc = "在当前行下方插入新行并返回普通模式"
}))
map("i", "<C-]>", "{<cr>}<C-o>O", vim.tbl_extend('force', opt, {
  desc = "插入花括号并换行缩进"
}))

