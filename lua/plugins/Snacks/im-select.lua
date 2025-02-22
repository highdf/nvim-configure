return {
	-- 作痛：可以快速切换输入法
	{
		"keaising/im-select.nvim",
		event = {"VeryLazy"},
		config = function()
			require("im_select").setup({})
		end,
	}
}
