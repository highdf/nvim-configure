return {
	{  -- 颜色代码可视化插件
		'norcalli/nvim-colorizer.lua',
		event = "BufRead",  -- 文件读取时加载（更精确的触发时机）

		config = function()
			require('colorizer').setup({  -- 默认配置启用以下功能：
				-- 自动识别格式: RGB, RRGGBB, #RGB, hsl(...)
				-- 支持文件类型: css, javascript, html, lua 等
				-- 实时颜色预览（光标停留时显示色块）
			})
		end,
	}
}
