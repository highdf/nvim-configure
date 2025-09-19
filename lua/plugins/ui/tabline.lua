return {
	-- 标签栏美化
	{  -- 智能标签页/缓冲区管理插件
		'kdheepak/tabline.nvim',
		event = "VeryLazy",  -- 延迟加载（降低启动开销）
		dependencies = {
			'nvim-tree/nvim-web-devicons'  -- 图标支持依赖（需Nerd字体）
		},

		config = function()
			require('tabline').setup {
				options = {
					-- 视觉元素配置
					section_separators = {'', 'O'},    -- 区块分隔符（Powerline风格）
					component_separators = {'', ''},  -- 组件分隔符

					-- 缓冲区显示设置
					max_bufferline_percent = 56,  -- 缓冲区列表最大占屏比（2/3屏幕宽度）
					show_filename_only = true,    -- 仅显示文件名（不包含路径）
					show_devicons = true,         -- 显示文件类型图标
					show_bufnr = false,           -- 隐藏缓冲区编号

					-- 标签页显示设置
					show_tabs_always = false,     -- 仅在多标签页时显示标签栏
					show_tabs_only = false,       -- 同时显示缓冲区和标签页

					-- 修改状态指示
					modified_icon = "+ ",         -- 修改标识符号
					modified_italic = true        -- 修改文件名为斜体
				}
			}
		end
	}
}
