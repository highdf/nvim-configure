return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = { } },
			"neovim/nvim-lspconfig",
		},
		opts = {
			automatic_enable = true,
			ensure_installed = {
				"jdtls",
				"pylsp",
				"clangd",
				"lua_ls",
				"bashls",
				"ts_ls",
			}
		},
	}
}
