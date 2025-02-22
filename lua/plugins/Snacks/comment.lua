return {
	-- 作用：提供各类文件的快捷注释
	{
		"folke/ts-comments.nvim",
		event = {"BufRead"},
		opts = {},
		config = function()
			require("ts-comments").setup({})
		end,
	}
}
