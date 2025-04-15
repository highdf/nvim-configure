return {
	{  -- Fcitx输入法状态自动管理
		'h-hg/fcitx.nvim',
		event = "VimEnter",  -- Neovim启动时立即加载

		-- 默认实现以下功能：
		-- 1. 插入模式自动切换为英文输入法
		-- 2. 普通模式恢复原输入法状态
		-- 3. 支持Linux系统(fcitx5)
	}
}
