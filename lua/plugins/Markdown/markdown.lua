return {
	-- 作用：生成目录
	{
		"hedyhli/markdown-toc.nvim",
		ft = "markdown",  -- Lazy load on markdown filetype
		keys = {
			{"<leader>mti",mode = "n","<cmd>Mtoc insert<cr>",desc = "Insert Toc"},
			{"<leader>mtu",mode = "n","<cmd>Mtoc update<cr>",desc = "Update Toc"},
			{"<leader>mtr",mode = "n","<cmd>Mtoc remove<cr>",desc = "Remove Toc"},
		},

		opts = {
		},
	},
	-- 作用：实时渲染
	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use the mini.nvim suite
		ft = "markdown",  -- Lazy load on markdown filetype
		keys = {
			{
				"<leader>mr",mode = "n","<cmd>RenderMarkdown toggle<cr>",desc = "render markdown",
			},
		},
		config = function() 
			require('render-markdown').setup({
				enabled = false,
				code = {
					sign = false,
					width = "block",
					right_pad = 1,
				},
			})
		end,
	}
}
