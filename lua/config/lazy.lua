-- Lazy.nvim介绍
-- Lazy.nvim是neovim的一个高性能插件管理器，提供的event这种事件加载机制从而提高了neovim的运行速度
-- 文档网站：https://lazy.folke.io/
-- =========================== --
-- 这里用来检测与配置lazy.nvim 

-- 检测lazy.nvim是否下载，若没有，则使用git自动clone到本地，
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
-- 将lazy.nvim的路径告诉neovim
vim.opt.rtp:prepend(lazypath)

-- 配置lazy.nvim 
require("lazy").setup({
	-- 制定要加载的插件模块
	spec = {
		{ import = 	"plugins.Ui"},
		{ import = 	"plugins.Treesitter"},
		{ import = 	"plugins.Snacks"},
		{ import = 	"plugins.Markdown"},
		{ import = 	"plugins.Blink"},
		{ import = 	"plugins.Dap"},
		{ import = 	"plugins.Lsp"},
		{ import = 	"plugins.Extras"},
	},
	defaults = {
		lazy = false,		-- 关闭懒加载，因为某些插件在懒加载下会出现非预期的行为
		version = false, 	-- 关闭制定版本,默认下载最新版
	},
	-- 指定lazy的UI界面所使用的主题 
	install = { colorscheme = { "catppuccin" } },
	checker = {
		enabled = true, 	-- 开启更新检查
		notify = false, 	-- 关闭更新通知
	}, 
	-- 屏蔽neovim中的一些不常用内置插件，从而提高运行速度，
	-- 若某些外部插件依赖这些插件，则可注释它们，以取消屏蔽
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
