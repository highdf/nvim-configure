return {
	{  -- 现代化文件管理器集成
		"mikavilpas/yazi.nvim",
		version = false,   -- 使用最新开发版本（功能更新更及时）
		lazy = true,       -- 按需加载（通过快捷键触发）

		keys = {  -- 文件管理快捷键
			{ "<leader>y", "<cmd>Yazi toggle<cr>", desc = "切换Yazi文件管理器" }
		},

		opts = {  -- 核心行为配置
			open_for_directories = false,  -- 仅在显式调用时打开（不自动接管目录操作）

			keymaps = {  -- 内置键位定制
				show_help = "<f1>",  -- 显示帮助面板（默认F1键）
				-- 其他键位保持默认：
				--   j/k 导航
				--   Enter 进入目录/打开文件
				--   Tab 切换面板
				--   Space 多选文件
			}
		}
	}
}
