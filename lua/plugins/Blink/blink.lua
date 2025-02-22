return {
	-- 网址：https://cmp.saghen.dev/configuration/sources
	-- 作用：增强neovim的补全功能
	{
		'saghen/blink.cmp',
		dependencies =  {			-- 指定依赖插件，它们会在blink.cmp加载之前被加载
			"folke/snacks.nvim",
			'rafamadriz/friendly-snippets',
			'echasnovski/mini.icons', version = '*',
		},
		version = '*',				-- 指定插件的版本
		event = "InsertEnter",		-- 指定加载事件：插入时加载

		opts = {
			keymap = { 				-- 使用VScode的自动补全快捷键 
				preset = 'default' ,
			},

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = 'mono'
			},

			sources = {
				-- 指定补全源
				default = { 'lsp', 'path', 'snippets', 'buffer', },
			},

			cmdline = {
				enabled = false,			-- 关闭命令行补全
			},		

			completion = {
				accept = {
					-- 在接受补全后，不自动追加括号
					auto_brackets = {
						enabled = false,
					},
				},
				menu = {
					-- 定义补全窗口样式
					min_width = 15,
					max_height = 15,
					winblend = 0,
					border = 'single',
					draw = {
					-- 使用mini.icons添加图标
						treesitter = { "lsp" },
						components = {
							kind_icon = {
								ellipsis = false,
								text = function(ctx)
									local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
									return kind_icon
							end,
								-- Optionally, you may also use the highlights from mini.icons
								highlight = function(ctx)
									local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
									return hl
								end,
							}
						}
					},
				},
				-- 指定补全文档样式
				documentation = {
					window = { border = 'single' },
					auto_show = true,
					auto_show_delay_ms = 200,
				},
			},
			signature = { window = { border = 'single' } },
		},
		opts_extend = { "sources.default" },
	},
}

