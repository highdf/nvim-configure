return {
	-- 作用：预览markdown文件
	{
		"iamcco/markdown-preview.nvim",
		lazy = true,
		-- build = "cd app && npm install",
		build = "cd app && yarn install",

		-- build = "cd app && yarn install",
		ft = { "markdown" },
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		keys = {
			{"<leader>mp",mode = {"n"},"<cmd>MarkdownPreviewToggle<enter>";desc = "view markdown"},
		},
	},
}
