return {
	-- 作用：提供各类文件的高亮，选择，缩进功能
	{  -- Treesitter语法增强核心插件
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",           -- 首次安装后自动更新语法解析器
		event = { "UIEnter" },         -- Neovim完全启动后加载

		config = function() 
			require('nvim-treesitter.configs').setup {
				-- 语法解析器管理
				ensure_installed = {       -- 预装主流语言语法支持
					"c", "java", "lua", "python",
					"bash", "make", "regex", "javascript",
					"html", "css", "yaml",
					"xml", "sql", "json5",
					"markdown", "markdown_inline"
				},

				-- 核心功能配置
				highlight = {              -- 增强语法高亮
					enable = true,
					additional_vim_regex_highlighting = false  -- 禁用传统正则高亮
				},

				-- 代码操作功能
				incremental_selection = {  -- 智能选区扩展
					enable = true,
					keymaps = {              -- 选区操作快捷键
						init_selection = "<cr>",    -- 回车开启选区
						node_incremental = "<cr>",  -- 回车逐级扩大选区
						scope_incremental = "<tab>",-- Tab按作用域扩大
						node_decremental = "<bs>"   -- 退格键缩小选区
					}
				},

				-- 代码格式支持
				indent = { enable = true } -- 基于语法的智能缩进
			}
		end,
	}
}
