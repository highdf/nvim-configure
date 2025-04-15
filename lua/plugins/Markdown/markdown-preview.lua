return {
	{  -- Markdown实时预览插件配置
		"iamcco/markdown-preview.nvim",
		lazy = true,                     -- 延迟加载（按需启用）
		build = "cd app && npm install", -- 前置依赖安装（需要Node.js环境）
		ft = { "markdown" },             -- 仅对Markdown文件类型生效

		keys = {  -- 快捷键映射
			{ "<leader>mp", mode = "n", "<cmd>MarkdownPreviewToggle<cr>", desc = "切换Markdown实时预览" },
		},
	},
}
