return  {
	{  -- 终端窗口管理系统
		'akinsho/toggleterm.nvim',
		version = "*",
		lazy = true,  -- 按需加载（通过快捷键触发）

		keys = {  -- 终端交互快捷键
			{ "<leader>tm", mode = "n", "<cmd>ToggleTerm name=float<cr>", desc = "打开浮动终端" },
			{ "<A-w>", mode = "t", "<C-u>exit<cr>", desc = "关闭终端窗口" },
			{ "<c-[>", mode = "t", "<C-\\><C-n>", desc = "返回普通模式" },  -- 等效<Esc>键
		},

		opts = {  -- 终端行为配置
			-- 基础设置
			direction = "horizontal",  -- 默认布局方向（可选：vertical/float/tab）

			-- 浮动窗口专属配置
			float_opts = {             
				border = "double",       -- 边框样式（single/double/shadow/curved）
				width = 75,              -- 占屏宽度百分比
				height = 20,             -- 占屏高度百分比
				winblend = 3,            -- 透明度混合级别（0-100）
				title_pos = "center"     -- 标题对齐方式
			},

			-- 自适应布局
			responsiveness = {
				horizontal_breakpoint = 135  -- 窗口宽度小于135列时自动切换垂直布局
			}
		}
	}
}
