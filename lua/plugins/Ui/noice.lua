return {
	-- 作用：对neovim的命令输出组件进行了美化
	{  -- 现代化UI增强套件（消息/通知/命令行美化）
		"folke/noice.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },  -- 基础UI组件依赖
		event = "VeryLazy",  -- 延迟加载（降低启动开销）

		config = function() 
			require("noice").setup({
				-- LSP文档增强
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,  -- 增强LSP提示转Markdown
						["vim.lsp.util.stylize_markdown"] = true,                  -- 美化Markdown渲染
						["cmp.entry.get_documentation"] = true,                    -- 集成补全文档
					},
				},

				-- 核心功能预设
				presets = {
					bottom_search = true,        -- 美化底部搜索/替换界面
					command_palette = true,      -- 增强命令行面板交互
					long_message_to_split = true,-- 长消息自动分割到缓存区

					-- 禁用/优化项
					inc_rename = false,         -- 禁用原生重命名输入框（推荐使用LSP重命名）
					lsp_doc_border = false       -- 禁用LSP文档边框（获得更简洁的外观）
				},
			})
		end
	},
}
