return {
	-- 作用：生成目录
	{  -- Markdown目录生成插件
		'mzlogin/vim-markdown-toc',
		config = function()
			-- 快捷键配置
			local map = vim.api.nvim_set_keymap
			local opt = { noremap = true, silent = true }
			map('n', '<leader>mi', '<cmd>GenTocGFM<cr>', opt)  -- 生成GitHub风格目录
			map('n', '<leader>md', '<cmd>RemoveToc<cr>', opt)  -- 删除目录
		end,
	},
}
