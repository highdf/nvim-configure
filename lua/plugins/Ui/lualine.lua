return {
	-- 状态栏美化
	{  -- 现代化状态栏组件
		"nvim-lualine/lualine.nvim",
		dependencies = {
			'nvim-tree/nvim-web-devicons'  -- 图标支持（需安装Nerd字体）
		},
		event = "VeryLazy",  -- 延迟加载（降低启动开销）

		config = function() 
			require('lualine').setup {
				-- 核心状态栏配置（默认包含以下模块）：
				-- 1. 文件路径显示（含图标）
				-- 2. Git分支/修改状态
				-- 3. 诊断信息（错误/警告计数）
				-- 4. LSP服务器状态
				-- 5. 编码格式/文件类型
				-- 6. 光标位置信息

				-- 标签栏集成（需单独配置tabline.nvim）
				--[[
				  tabline = {
					lualine_c = { 'filename' },  -- 显示缓冲区文件名
					lualine_x = { 'tabs' },      -- 显示标签页导航
				  },
				  --]]
			}
		end
	}
}
