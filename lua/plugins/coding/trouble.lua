return {
	{  -- 诊断/符号/LSP信息可视化面板
		"folke/trouble.nvim",
		event = "VeryLazy",
		cmd = "Trouble",
		opts = {},

		keys = {  -- 分层诊断导航系统
			-- 核心诊断操作
			{ "<leader>co", "<cmd>Trouble loclist toggle<cr>", desc = "显示位置列表" },
			{ "<leader>cq", "<cmd>Trouble qflist toggle<cr>", desc = "显示快速修复列表" },
			{ "<leader>cd", "<cmd>Trouble diagnostics toggle focus=true<cr>",  desc = "显示诊断信息" },

			-- 代码符号导航
			{ "<leader>cs", "<cmd>Trouble symbols toggle<cr>", desc = "查看文档符号" },

			-- LSP智能导航
			{ "<leader>cl", "<cmd>Trouble lsp toggle win.position=right<cr>",desc = "LSP定义/引用追踪" }
		}
	}
}
