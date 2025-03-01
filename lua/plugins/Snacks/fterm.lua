return  {
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		lazy = true;

		keys = {
			{
				"<leader>tm",
				mode = "n",
				"<cmd>ToggleTerm name=float<cr>",
				desc = "open float term",
			},
			{
				"<A-w>",
				mode = "t",
				"<C-u>exit<cr>",
				desc = "close terminal",
			},
			{
				"<c-[>",
				mode = "t",
				"<C-\\><C-n>",
				desc = "into narmal",
			},
		},
		opts = {
			direction = "float",        -- 支持：vertical/horizontal/tab/float
			float_opts = {
				border = "double",        -- 边框样式（支持 single/double/shadow）
				width = 75,              -- 窗口宽度
				height = 20,              -- 窗口高度
				winblend = 3,             -- 窗口透明度（0-100）
				title_pos = "center"      -- 标题位置
			},
			-- 响应式布局
			responsiveness = {
				horizontal_breakpoint = 135 -- 窗口宽度小于该值时垂直堆叠
			}
		}
	}
}
