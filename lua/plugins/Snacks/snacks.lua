return {
	{  -- 多功能集成插件集 (UI增强/工具集成/LSP导航)
		"folke/snacks.nvim",
		priority = 1000,    -- 高优先级加载
		lazy = false,       -- 启动时立即加载

		opts = {            -- 模块化功能配置
			-- 核心功能
			input = { enabled = true },    -- 智能输入增强

			-- UI增强组件
			indent = { enabled = true },   -- 智能缩进参考线
			notifier = { enabled = true }, -- 通知历史管理系统
			scroll = { enabled = true },   -- 平滑滚动动画

			-- 工具集成
			bufdelete = { enabled = true },-- 安全缓冲区删除
			lazygit = { enabled = true },  -- Git可视化集成
			image = { enabled = true },    -- 图片预览支持

			-- 导航增强
			picker = { enabled = true }    -- 模糊搜索系统
		},

		keys = {  -- 分层快捷键配置
			-- 通知管理
			{ "<leader>sn", function() Snacks.notifier.show_history() end, desc = "显示通知历史" },

			-- 缓冲区操作
			{ "<leader>bd", function() Snacks.bufdelete.delete() end, desc = "安全删除当前缓冲区" },
			{ "<leader>bo", function() Snacks.bufdelete.other() end, desc = "删除其他缓冲区" },

			-- 版本控制
			{ "<leader>sl", function() Snacks.lazygit.open() end, desc = "打开Lazygit面板" },

			-- 快速搜索导航
			{ "<A-s>f", function() Snacks.picker.smart() end, desc = "智能文件搜索" },
			{ "<A-s>b", function() Snacks.picker.buffers() end, desc = "缓冲区搜索" },
			{ "<A-s>g", function() Snacks.picker.grep() end, desc = "全文内容搜索" },
			{ "<A-s>h", function() Snacks.picker.command_history() end, desc = "命令历史搜索" },

			-- LSP智能导航
			{ "gd", function() Snacks.picker.lsp_definitions() end, desc = "跳转定义" },
			{ "gD", function() Snacks.picker.lsp_declarations() end, desc = "跳转声明" },
			{ "gr", function() Snacks.picker.lsp_references() end, desc = "查看引用", nowait = true },
			{ "gl", function() Snacks.picker.lsp_implementations() end, desc = "跳转实现" },
			{ "gt", function() Snacks.picker.lsp_type_definitions() end, desc = "类型定义" }
		}
	}
}
			-- dim = { 
			-- 	enabled = true,
			-- 	dashboard = { example = "github" }
			-- },
			-- util = { 
			-- 	enabled = true,
			-- 	dashboard = { example = "github" }
			-- },
			-- zeo = { 
			-- 	enabled = true,
			-- 	dashboard = { example = "github" }
			-- },
			-- zeo
			-- {"<leader>sze",mode = {"n"},function() snacks.zen.zen() end,desc = "tooggle zeo"},
			
			-- { "<A-s>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
			-- words = {		-- words 的集成
			-- 	enabled = true,
			-- 	-- dashboard = { example = "github" }
			-- },
		 	-- words
			-- {"<leader>sj",mode = {"n"},function() Snacks.words.jump(1) end,desc = "jump word"},
			-- input = { 		-- 优化输出函数
			-- 	enabled = true,
			-- 	-- dashboard = { example = "github" }
			-- },
			-- scope = {		-- scope 的集成
			-- 	enabled = true,
			-- 	-- dashboard = { example = "github" }
			-- },
			-- -- scope
			-- {"<leader>sj",mode = {"n","v"},function() Snacks.scope.textobject() end,desc = "open lazygit"},
			-- bigfile = { 	-- 提高neovim渲染文件的速度
			-- 	enabled = true,
			-- 	-- dashboard = { example = "github" }
			-- },
			-- quickfile = { 	-- 
			-- 	enabled = true,
			-- 	-- dashboard = { example = "github" }
			-- },
