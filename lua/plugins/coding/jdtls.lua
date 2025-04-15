return {
	{
		"mfussenegger/nvim-jdtls",

		config = function()
			local config = require "lsp.config.jdtls"

			vim.api.nvim_create_autocmd("Filetype", {
				pattern = "java",
				callback = function()
					require("jdtls").start_or_attach(config)
				end,
			})
		end
	},
}


