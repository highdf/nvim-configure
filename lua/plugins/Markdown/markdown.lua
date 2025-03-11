return {
	-- 作用：生成目录
	{
		'mzlogin/vim-markdown-toc',

		config = function()
			local map = vim.api.nvim_set_keymap
			local opt = {noremap = true, silent = true }
			map('n','<leader>mi','<cmd>GenTocGFM<cr>',opt)
			map('n','<leader>mr','<cmd>RemoveToc<cr>',opt)
		end,
	},
}
