return {
	-- 作用：预览markdown文件
	
	{
		"iamcco/markdown-preview.nvim",
		lazy = true,
		build = "cd app && npm install",
		ft = { "markdown" },

		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
			vim.g.mkdp_browser = '/usr/bin/firefox'
		end,

		keys = {
			{"<leader>mp",mode = {"n"},"<cmd>MarkdownPreviewToggle<enter>";desc = "view markdown"},
		},
	},
}
