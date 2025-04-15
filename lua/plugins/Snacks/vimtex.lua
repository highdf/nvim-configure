return {
	{  -- LaTeX高效写作环境集成
		"lervag/vimtex",
		lazy = false,  -- 立即加载（LaTeX编译依赖实时初始化）

		init = function()  -- 核心配置参数
			vim.g.vimtex_quickfix_mode = 0     -- 禁用自动quickfix弹窗（避免界面干扰）
			vim.g.vimtex_view_method = "zathura"  -- 使用Zathura作为PDF阅读器
			vim.g.tex_flavor = 'latex'         -- 默认使用LaTeX语法规范
			vim.g.vimtex_compiler_method = 'latexmk' -- 编译引擎使用latexmk
		end,

		keys = {  -- LaTeX工作流快捷键
			{ "<A-a>c", "<cmd>VimtexClean<cr>",  desc = "清理编译产物(.aux/.log等)" },
			{ "<A-a>o", "<cmd>VimtexCompile<cr>",desc = "编译LaTeX文档" },
			{ "<A-a>v", "<cmd>VimtexView<cr>",   desc = "在Zathura中预览PDF" }
		}
	}
}
