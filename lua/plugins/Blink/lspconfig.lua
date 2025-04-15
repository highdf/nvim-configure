return {
	-- 作用：用于简化neovim的lsp的配置
	--网址：https://github.com/neovim/nvim-lspconfig
	{
	 	'neovim/nvim-lspconfig',
		dependencies = { 
			'saghen/blink.cmp',
			"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
			-- "williamboman/mason.nvim",
			-- "williamboman/mason-lspconfig.nvim",
		},
		event = "InsertEnter",

		keys = {
			{"<leader>ls",mode = "n","<cmd>LspStart<cr>",desc = "Lanuch Lsp",},
			{"<leader>lt",mode = "n","<cmd>LspStop<cr>",desc = "Stop Lsp",},
			{"<leader>ll",mode = "n","<cmd>LspLog<cr>",desc = "Open Log",},
		},

		opts = {
			-- 配置使用的语言服务器
			servers = {
				clangd = {
					cmd = {"clangd"}, 
					filetypes = {"c", "cpp", "objc", "objcpp"},
					init_options = {
						usePlaceholders = true,
						completeUnimported = true,
						semanticHighlighting = true,
						clangdFileStatus = true,
					},
					capabilities = {
						offsetEncoding = { "utf-16" },
					},
					settings = {},
				},
				jdtls = {
					cmd = {"jdtls"}, 
					filetypes = {"java"},
					init_options = {
						usePlaceholders = true,
						completeUnimported = true,
						semanticHighlighting = true,
						clangdFileStatus = true,
					},
					capabilities = {
						offsetEncoding = { "utf-16" },
					},
					settings = {},

				},
				pylsp = {
					cmd = {"pylsp"}, 
					filetypes = {"python"},
					init_options = {
						usePlaceholders = true,
						completeUnimported = true,
						semanticHighlighting = true,
						clangdFileStatus = true,
					},
					capabilities = {
						offsetEncoding = { "utf-16" },
					},
					settings = {},

				},
			}
		},

		-- 合并语言服务器的补全源到blink中
		config = function(_, opts)
			local lspconfig = require('lspconfig')
			for server, config in pairs(opts.servers) do
				config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
		end
	},
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		lazy = true,

		config = function()
			require("lsp_lines").setup()
			-- 禁用默认的虚拟文本
			vim.diagnostic.config({ virtual_text = false })
			vim.diagnostic.config({ virtual_lines = true })
		end,
	},
}
