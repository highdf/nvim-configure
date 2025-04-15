return {
	{
		'norcalli/nvim-colorizer.lua',
		event = "BufRead",
		config = function()
			require('colorizer').setup({
				'*'; -- 为所有文件类型启用
			}, {
					RGB      = true,    -- #RGB 格式
					RRGGBB   = true,    -- #RRGGBB 格式
					names    = true,    -- 颜色名称 (如 "red")
					RRGGBBAA = true,    -- #RRGGBBAA 格式
					rgb_fn   = true,    -- CSS rgb() 函数
					hsl_fn   = true,    -- CSS hsl() 函数
					css      = true,    -- 启用所有 CSS 特性
					css_fn   = true,    -- 启用 CSS 函数
					-- mode     = 'virtualtext', -- 显示在右侧的虚拟文本
				})

			-- 立即为当前所有缓冲区启用
			vim.defer_fn(function()
				require('colorizer').attach_to_buffer(0)
			end, 0)
		end,
	}
}
