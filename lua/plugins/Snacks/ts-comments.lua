return {
	-- 作用：提供各类文件的快捷注释
	{  -- Treesitter智能注释增强插件
		"folke/ts-comments.nvim",
		event = "BufRead",  -- 文件读取时按需加载
		dependencies = {'JoosepAlviste/nvim-ts-context-commentstring'},


		-- 内置默认配置已包含以下核心功能：
		-- 1. 基于AST的精准注释检测
		-- 2. 支持多种编程语言注释风格
		-- 3. 智能注释切换（toggle）功能
		config = true  -- 启用默认配置（替代空setup调用）
	}
}
