return {
	-- 作用：用于简化neovim的lsp的配置
	--网址：https://github.com/neovim/nvim-lspconfig
	{
		'neovim/nvim-lspconfig',          -- Neovim官方LSP配置插件
		dependencies = { 
			'saghen/blink.cmp',            -- 补全增强插件
			"https://git.sr.ht/~whynothugo/lsp_lines.nvim",  -- 诊断信息行内显示
		},
		event = { "BufReadPost", "BufNewFile" }, -- 文件打开时初始化

		keys = {  -- 快捷键映射
			{"<leader>ls", mode = "n", "<cmd>LspStart<cr>", desc = "启动LSP服务"},
			{"<leader>lt", mode = "n", "<cmd>LspStop<cr>",  desc = "停止LSP服务"},
			{"<leader>ll", mode = "n", "<cmd>LspLog<cr>",   desc = "查看LSP日志"},
		},

		opts = {  -- 语言服务器配置
			servers = {  -- 支持的编程语言列表
				clangd = {},    -- C/C++ 语言服务器
				jdtls = {},     -- Java 语言服务器 
				pylsp = {},     -- Python 语言服务器
				lua_ls = {},
				bashls = {},
				sqls = {}, 		-- SQL 语言服务器     
			}
		},

		-- LSP配置与补全集成
		config = function(_, opts)
			local lspconfig = require('lspconfig')
			-- 为每个语言服务器注入补全能力
			for server, config in pairs(opts.servers) do
				config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup({config})
			end
		end
	},

	{  -- LSP诊断行内显示插件配置
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		lazy = false,  -- 立即加载（诊断功能需全局生效）

		config = function()
			-- 插件基础配置
			require("lsp_lines").setup({
				highlight_hovered_item = true,    -- 悬停时高亮诊断项
				show_diagnostic_source = true     -- 显示诊断来源（如eslint、pylint）
			})

			-- 全局诊断显示设置
			vim.diagnostic.config({
				virtual_text = false,  -- 禁用传统悬浮式诊断文本
				virtual_lines = {      -- 启用行内虚拟线诊断
					only_current_line = true,    -- 仅当前行显示诊断线
					highlight_whole_line = false -- 不高亮整行背景
				},
				underline = true,     -- 保留错误下划线
				signs = true,         -- 保留左侧标记符号
				update_in_insert = false  -- 插入模式不更新诊断（避免干扰）
			})
		end
	},
}
