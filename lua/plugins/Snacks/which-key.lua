return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "显示所有快捷键菜单",
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
		end
	}
}
