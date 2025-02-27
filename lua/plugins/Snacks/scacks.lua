return {
	{
		"folke/snacks.nvim",
		-- dependencies = {
		-- 	"nvim-treesitter/nvim-treesitter",
		-- },
		priority = 1000,
		lazy = false,

		opts = {
			bigfile = { 	-- 提高neovim渲染文件的速度
				enabled = true,
				-- dashboard = { example = "github" }
			},
			quickfile = { 	-- 
				enabled = true,
				-- dashboard = { example = "github" }
			},
			input = {
				enabled = true,
			},
			indent = { 		-- 提供缩进线
				enabled = true,
				-- dashboard = { example = "github" }
			},
			notifier = {	-- 提供通知浮窗
				enabled = true,
			},
			scroll = {		-- 实现丝滑的滚动动画 
				enabled = true,
				-- dashboard = { example = "github" }
			},
			bufdelete = {	-- 让删除缓存区不破坏窗口布局 
				enabled = true,
				-- dashboard = { example = "github" }
			},
			lazygit = {		-- lazygit 的集成
				enabled = true,
				-- dashboard = { example = "github" }
			},
			picker = {		-- picker 的集成
				enabled = true,
				-- dashboard = { example = "github" }
			},
			image = {		-- image 的集成
				enabled = true,
				-- dashboard = { example = "github" }
			},
		},
		keys = {
			-- notifier 
			{"<leader>sn",mode = {"n"},function() Snacks.notifier.show_history() end,desc = "show history"},
			-- bufdelete
			{"<leader>bd",mode = {"n"},function() Snacks.bufdelete.delete() end,desc = "delet current buffer"},
			{"<leader>bo",mode = {"n"},function() Snacks.bufdelete.other() end,desc = "delet current buffer"},
			-- lazygit
			{"<leader>sl",mode = {"n"},function() Snacks.lazygit.open() end,desc = "open lazygit"},
			-- picker search
			{ "<A-s>f", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
			{ "<A-s>b", function() Snacks.picker.buffers() end, desc = "Buffers" },
			{ "<A-s>g", function() Snacks.picker.grep() end, desc = "Grep" },
			{ "<A-s>h", function() Snacks.picker.command_history() end, desc = "Command History" },
			-- picker lsp
			{ "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
			{ "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
			{ "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
			{ "gl", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
			{ "gt", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
		},
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
