return {
	-- 作用：提供各类文件的高亮，选择，缩进功能
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "UIEnter" },

		config = function() 
			require'nvim-treesitter.configs'.setup {
				ensure_installed = {
					"c",
					"java",
					"make",
					"lua",
					"markdown",
					"markdown_inline",
					"bash",
				},
				-- 启用高亮功能
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<cr>",       -- 映射初始选择
						node_incremental = "<cr>",     -- 节点递增选择
						scope_incremental = "<tab>",   -- 作用域递增选择
						node_decremental = "<bs>"      -- 节点递减选择
					}
				},
			}
		end,
	}
}
