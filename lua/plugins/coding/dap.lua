return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
		},

		keys = {
			{ "<F8>", function() require("dap").continue() end, desc = "运行/继续" },
			{ "<F9>", function() require("dap").toggle_breakpoint() end, desc = "切换断点" },
			{ "<F10>", function() require("dap").step_into() end, desc = "步入" },
			{ "<F11>", function() require("dap").step_over() end, desc = "步过" },
			{ "<F12>", function() require("dap").step_out() end, desc = "步出" },
			{ "<A-d>b", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "设置条件断点" },
			{ "<A-d>a", function() require("dap").continue({ before = get_args }) end, desc = "带参数运行" },
			{ "<A-d>C", function() require("dap").run_to_cursor() end, desc = "运行到光标处" },
			{ "<A-d>g", function() require("dap").goto_() end, desc = "跳转到行(不执行)" },
			{ "<A-d>j", function() require("dap").down() end, desc = "向下移动调用栈" },
			{ "<A-d>k", function() require("dap").up() end, desc = "向上移动调用栈" },
			{ "<A-d>l", function() require("dap").run_last() end, desc = "重新运行上次调试" },
			{ "<A-d>p", function() require("dap").pause() end, desc = "暂停" },
			{ "<A-d>r", function() require("dap").repl.toggle() end, desc = "切换REPL控制台" },
			{ "<A-d>s", function() require("dap").session() end, desc = "查看调试会话" },
			{ "<A-d>t", function() require("dap").terminate() end, desc = "终止调试" },
			-- { "<A-d>w", function() require("dap.ui.widgets").hover() end, desc = "显示调试信息" }
		},

		config = function()
			require("dap_config.c")
		end,
	}
}
