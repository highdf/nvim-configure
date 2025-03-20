return {
	-- 作用：生成目录
	{
		'mzlogin/vim-markdown-toc',

		config = function()
			local map = vim.api.nvim_set_keymap
			local opt = {noremap = true, silent = true }
			map('n','<leader>mi','<cmd>GenTocGFM<cr>',opt)
			map('n','<leader>md','<cmd>RemoveToc<cr>',opt)
		end,
	},
	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		ft = { 'markdown', 'quarto' },

		keys = {
			{
				"<leader>mr",mode = "n","<cmd>RenderMarkdown toggle<cr>",desc = "open render markdown",
			},
		},

		config = function()
			require('render-markdown').setup({
				enabled = false,
			})
		end,
	}
}
