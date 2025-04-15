--- 这里定义了以下快捷键

------------------------------------
-- 起始设置
------------------------------------
vim.g.mapleader = "\\" -- 定义全局 Leader 键
vim.g.maplocalleader = "\\" -- 定义本地 Leader 键
local map = vim.keymap.set -- 使用支持 desc 的新 API
local opt = { noremap = true, silent = true } -- 基础选项

-----------------------------------------
-- [文件与目录操作]
-----------------------------------------
map (
  "n",
  "<leader>%",
  "<cmd>cd %:p:h<cr>",
  vim.tbl_extend ("force", opt, {
    desc = "Switch to current file's directory as working directory",
  })
)

-----------------------------------------
-- [文本转换操作]
-----------------------------------------
map (
  "i",
  "<C-b>",
  "<C-[>gUawA",
  vim.tbl_extend ("force", opt, {
    desc = "Convert current word to uppercase",
  })
)
map (
  "i",
  "<C-s>",
  "<C-[>guawA",
  vim.tbl_extend ("force", opt, {
    desc = "Convert current word to lowercase",
  })
)

-----------------------------------------
-- [插件管理系统]
-----------------------------------------
map (
  "n",
  "<leader>lz",
  "<cmd>Lazy<cr>",
  vim.tbl_extend ("force", opt, {
    desc = "Open lazy.nvim plugin manager",
  })
)

-----------------------------------------
-- [代码结构操作]
-----------------------------------------
local change_inside = function (key, description)
  map (
    "n",
    "<leader>" .. key,
    "ci" .. key,
    vim.tbl_extend ("force", opt, {
      desc = "Change inside " .. description,
    })
  )
end

change_inside ("(", "parentheses")
change_inside ("[", "square brackets")
change_inside ("{", "curly braces")
change_inside ("'", "single quotes")
change_inside ('"', "double quotes")
change_inside ("<", "angle brackets")

-----------------------------------------
-- [标签页管理]
-----------------------------------------
map (
  "n",
  "<leader>tt",
  "<cmd>tabnew<cr>",
  vim.tbl_extend ("force", opt, {
    desc = "Create new tab",
  })
)
map (
  "n",
  "<leader>to",
  "<cmd>tabonly<cr>",
  vim.tbl_extend ("force", opt, {
    desc = "Close all tabs except current",
  })
)
map (
  "n",
  "<leader>tc",
  "<cmd>tabclose<cr>",
  vim.tbl_extend ("force", opt, {
    desc = "Close current tab",
  })
)
map (
  "n",
  "<leader>tn",
  "<cmd>tabnext<cr>",
  vim.tbl_extend ("force", opt, {
    desc = "Switch to next tab",
  })
)
map (
  "n",
  "<leader>tp",
  "<cmd>tabprev<cr>",
  vim.tbl_extend ("force", opt, {
    desc = "Switch to previous tab",
  })
)

-----------------------------------------
-- [寄存器操作]
-----------------------------------------
-- 普通模式寄存器粘贴
local reg_map_normal = function (num)
  map (
    "n",
    "<leader>" .. num,
    '"' .. num .. "p",
    vim.tbl_extend ("force", opt, {
      desc = "Paste content from register " .. num,
    })
  )
end

-- 可视模式寄存器粘贴
local reg_map_visual = function (num)
  map (
    "v",
    "<leader>" .. num,
    '"' .. num .. "p",
    vim.tbl_extend ("force", opt, {
      desc = "Replace selection with content from register " .. num,
    })
  )
end

-- 创建寄存器映射（0-9）
for i = 0, 9 do
  reg_map_normal (tostring (i))
  reg_map_visual (tostring (i))
end

-- 特殊粘贴操作
map (
  "n",
  "<leader>+",
  'o<Esc>"+p',
  vim.tbl_extend ("force", opt, {
    desc = "Create new line and paste from system clipboard",
  })
)

-----------------------------------------
-- [构建系统集成]
-----------------------------------------
map (
  "n",
  "<leader>mk",
  "<cmd>wa | make<cr>",
  vim.tbl_extend ("force", opt, {
    desc = "Save all files and execute make command",
  })
)
map (
  "n",
  "<leader>Mk",
  "<cmd>argadd Makefile | edit Makefile<cr>",
  vim.tbl_extend ("force", opt, {
    desc = "Add and edit Makefile",
  })
)

-----------------------------------------
-- [缓冲区管理]
-----------------------------------------
map (
  "n",
  "<leader>bn",
  "<cmd>bn<cr>",
  vim.tbl_extend ("force", opt, {
    desc = "Switch to next buffer",
  })
)
map (
  "n",
  "<leader>bp",
  "<cmd>bp<cr>",
  vim.tbl_extend ("force", opt, {
    desc = "Switch to previous buffer",
  })
)
map (
  "n",
  "<leader>bl",
  "<cmd>ls<cr>",
  vim.tbl_extend ("force", opt, {
    desc = "List all buffers",
  })
)
map (
  "n",
  "<leader>bf",
  "<cmd>bf<cr>",
  vim.tbl_extend ("force", opt, {
    desc = "Switch to first buffer",
  })
)
map (
  "n",
  "<leader>be",
  "<cmd>bl<cr>",
  vim.tbl_extend ("force", opt, {
    desc = "Switch to last buffer",
  })
)

-----------------------------------------
-- [系统剪贴板集成]
-----------------------------------------
map (
  "v",
  "<A-v>",
  '"+p',
  vim.tbl_extend ("force", opt, {
    desc = "Paste from system clipboard to selection",
  })
)
map (
  "v",
  "<A-c>",
  '"+y',
  vim.tbl_extend ("force", opt, {
    desc = "Copy selection to system clipboard",
  })
)

-----------------------------------------
-- [窗口管理]
-----------------------------------------
map (
  "n",
  "<A-h>",
  "<C-w>h",
  vim.tbl_extend ("force", opt, {
    desc = "Focus left window",
  })
)
map (
  "n",
  "<A-j>",
  "<C-w>j",
  vim.tbl_extend ("force", opt, {
    desc = "Focus bottom window",
  })
)
map (
  "n",
  "<A-k>",
  "<C-w>k",
  vim.tbl_extend ("force", opt, {
    desc = "Focus top window",
  })
)
map (
  "n",
  "<A-l>",
  "<C-w>l",
  vim.tbl_extend ("force", opt, {
    desc = "Focus right window",
  })
)
map (
  "n",
  "<A-o>",
  "<C-w>o",
  vim.tbl_extend ("force", opt, {
    desc = "Close other windows (keep only current)",
  })
)
map (
  "n",
  "<A-c>",
  "<C-w>c",
  vim.tbl_extend ("force", opt, {
    desc = "Close current window",
  })
)

-----------------------------------------
-- [Lsp操作]
-----------------------------------------
map (
  { "n", "v" },
  "<leader>la",
  "<cmd>lua vim.lsp.buf.code_action()<cr>",
  vim.tbl_extend ("force", opt, {
    desc = "Show LSP code actions at cursor position",
  })
)

-----------------------------------------
-- [其他操作]
-----------------------------------------
map (
  "n",
  "<leader>gy",
  "<cmd>%y +<cr>",
  vim.tbl_extend ("force", opt, {
    desc = "Yank entire buffer to system clipboard",
  })
)
map (
  "n",
  "<leader>gp",
  "<cmd>%d _ |put! +<cr>",
  vim.tbl_extend ("force", opt, {
    desc = "Replace entire buffer with system clipboard content",
  })
)

map (
  "i",
  "<C-l>",
  "<C-o>zt",
  vim.tbl_extend ("force", opt, {
    desc = "Clear screen (recenter cursor)",
  })
)

map (
  "n",
  "<leader><leader>",
  "o<C-[>k",
  vim.tbl_extend ("force", opt, {
    desc = "Insert a empty line on next line",
  })
)
