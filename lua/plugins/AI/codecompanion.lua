return {
	{
		"olimorris/codecompanion.nvim",
		lazy = false,

		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"github/copilot.vim",
		},
		keys = {
			{"<leader>da", mode = {"n", "v"}, "<cmd>CodeCompanionActions<cr>", desc = "打开codecompanion 菜单"},
			{"<leader>dt", mode = {"n", "v"}, "<cmd>CodeCompanionChat Toggle<cr>", desc = "打开codecompanion 对话"},
			{"<leader>ds", mode = {"n", "v"}, "<cmd>CodeCompanion<cr>", desc = "打开codecompanion 对话"},
		},

		opts = {
			adapters = {
				deepseek = function()
					return require("codecompanion.adapters").extend("deepseek", {
						model = "deepseek-r1",
						env = {
							api_key = "DEEPSEEK_API_KEY",
						},
					})
				end,
			},
			strategies = {
				chat = {
					adapter = "deepseek"
				},
				inline = {
					adapter = "copilot"
				}
			},
			display = {
				chat = {
					window = {
						position = "right",
						wrap = true,
					},
				},
				diff = {
					enabled = true,
					close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
					layout = "vertical", -- vertical|horizontal split for default provider
					opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
					provider = "default", -- default|mini_diff
				},
			},
			opts = {
				language = "Chinese",
			},
		},
	}
}
