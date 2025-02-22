return {
	-- 作用：生成包裹符号
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = {"BufRead","InsertEnter"},
		config = function()
			require("nvim-surround").setup({
			})
		end
	}
}
