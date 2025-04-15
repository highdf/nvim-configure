return {
	{  -- Catppuccin 主题（柔和糖果色系）
		"catppuccin/nvim",
		name = "catppuccin",  -- 主题显示名称（可省略，默认同仓库名）
		priority = 1000,      -- 高优先级加载（主题需尽早初始化）
		-- 主要特性：
		--  - 4种预设风格: latte, frappe, macchiato, mocha
		--  - 完善的LSP/Lualine/Treesitter支持
		--  - 可自定义配色方案
		-- 启用示例：
		-- config = function()
		--   require("catppuccin").setup({ 
		--     flavour = "mocha",       -- 默认风味
		--     transparent_background = false 
		--   })
		--   vim.cmd.colorscheme("catppuccin")
		-- end
	},

	{  -- TokyoNight 主题（现代霓虹风格）
		"folke/tokyonight.nvim",
		priority = 1000,
		-- 主要特性：
		--  - 4种变体: night, storm, day, moon
		--  - 集成Lualine主题支持
		--  - 自适应终端配色
		-- 启用示例：
		-- config = function()
		--   require("tokyonight").setup({
		--     style = "storm",         -- 默认样式
		--     transparent = false,
		--     terminal_colors = true  
		--   })
		--   vim.cmd.colorscheme("tokyonight")
		-- end
	},

	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	priority = 1000,
	-- },
	-- {
	--
	-- 	"loctvl842/monokai-pro.nvim",
	-- 	config = function()
	-- 		require("monokai-pro").setup()
	-- 	end
	--
	-- }
}
