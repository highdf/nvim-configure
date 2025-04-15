--- 这里定义了以下快捷键

------------------------------------
-- 起始设置
------------------------------------
vim.g.mapleader = "\\" -- 定义全局 Leader 键
vim.g.maplocalleader = "\\" -- 定义本地 Leader 键
local map = vim.keymap.set -- 使用支持 desc 的新 API
local opt = { noremap = true, silent = true } -- 基础选项

-----------------------------------------
-- [insert mode]
-----------------------------------------
map (
  "i",
  "<C-a>",
  "<C-[>I",
  vim.tbl_extend ("force", opt, {
    desc = "Jump to start of the line",
  })
)

map (
  "i",
  "<C-l>",
  "<C-[>zti",
  vim.tbl_extend ("force", opt, {
    desc = "Clear screen (recenter cursor)",
  })
)

map (
  "i",
  "<C-e>",
  "<C-[>A",
  vim.tbl_extend ("force", opt, {
    desc = "JUmp to end of the line",
  })
)
map (
  "i",
  "<C-u>",
  "<C-[>gUawea",
  vim.tbl_extend ("force", opt, {
    desc = "Convert current word to uppercase",
  })
)

-----------------------------------------
-- [lazy.nvim manager]
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
-- [inside Change]
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
-- [tab operation]
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
-- [register operation]
-----------------------------------------
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

for i = 0, 9 do
  reg_map_normal (tostring (i))
  reg_map_visual (tostring (i))
end

map (
  "n",
  "<leader>+",
  'o<Esc>"+p',
  vim.tbl_extend ("force", opt, {
    desc = "Create new line and paste from system clipboard",
  })
)

-----------------------------------------
-- [make app]
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
-- [buffer operation]
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
-- [visual mode]
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
-- [window operation]
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
-- [Lsp operation]
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
-- [misc]
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
  "n",
  "<leader><leader>",
  "o<C-[>k",
  vim.tbl_extend ("force", opt, {
    desc = "Insert a empty line on next line",
  })
)
