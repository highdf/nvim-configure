return {
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",

		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio" -- 添加这行关键依赖
		},

		keys = {
			{"<A-d>e", mode = "n", "<cmd>lua require('dapui').toggle()<cr>", desc = "打开/关闭调试窗口"},
			{"<A-d>w", mode = {"n", "v"}, ":lua require('dapui').eval()<cr>", desc = "评诂表过式"},
		},

		opts = {
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.25 },
						{ id = "stacks", size = 0.25 },
						{ id = "breakpoints", size = 0.25 },
						{ id = "watches", size = 0.25 },
					},
					position = "left",
					size = 38
				},
				{
					elements = {
						{ id = "console", size = 0.5 },
						{ id = "repl", size = 0.5 },
					},
					position = "bottom",
					size = 13
				}
			}
		},
	},

	{
		"theHamsta/nvim-dap-virtual-text",
		event = "VeryLazy",

		dependencies = {
			"mfussenegger/nvim-dap",
		},

		opts = {
			enabled = true,                     -- 默认启用
			highlight_changed_variables = true, -- 值变化时高亮
			show_stop_reason = true,            -- 显示暂停原因
			commented = false,                  -- 不在注释中显示
			virt_text_pos = 'eol',
		},
	},
}
