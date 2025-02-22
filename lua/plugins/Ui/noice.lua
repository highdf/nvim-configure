return {
	-- 作用：对neovim的命令输出组件进行了美化
	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			-- "folke/snacks.nvim",
		},
		event = "VeryLazy",

		config = function() 
			require("noice").setup({
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				presets = {
					bottom_search = true, 			-- 搜索美化
					command_palette = true,			-- 命令行美化 
					long_message_to_split = true, 	-- 启用长消息缓存区
					inc_rename = false, 			-- 禁用inx_rename输入框
					lsp_doc_border = false, 		-- 美化lsp文档
				},
			})
		end,
	},
}
