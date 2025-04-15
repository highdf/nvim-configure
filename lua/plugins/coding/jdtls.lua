return {
	{
		"mfussenegger/nvim-jdtls",

		config = function()
			local lsp_util = require("utils.lsp_util")
			local config = require(lsp_util.cofig_require_path .. "jdtls")

			vim.api.nvim_create_autocmd("Filetype", {

				pattern = "java",
				callback = function()
					require("jdtls").start_or_attach(config)
				end,
			})
		end,
	},
}
