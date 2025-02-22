return  {
	-- 作用：下载语言服务器，语言调试器等等
	-- 网址：https://github.com/williamboman/mason-lspconfig.nvim
	{
		"williamboman/mason.nvim",
		lazy = true,
		keys = { { "<leader>ms", "<cmd>Mason<cr>", desc = "Mason" } },

		config = function() 
			require('mason').setup()
		end,
	},

	-- 作用：将lspconfig与mason连接起来，简化相关配置
	{ 
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim",},
		lazy = true,

		donfig = function() 
			require("mason-lspconfig").setup()
		end,
	}
}
