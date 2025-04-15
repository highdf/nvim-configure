return  {
	{  -- 实时Markdown渲染插件
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 
			'nvim-treesitter/nvim-treesitter',  -- 语法解析依赖
			'echasnovski/mini.icons'            -- 图标显示支持
		},
		ft = { 'markdown', 'quarto', 'codecompanion' },        -- 仅对指定文件类型生效

		keys = {
			{ "<leader>mr", mode = "n", "<cmd>RenderMarkdown toggle<cr>", desc = "切换Markdown渲染预览" },
		},

		config = function()
			require('render-markdown').setup({
				enabled = true,  -- 默认禁用自动渲染（需手动触发）
			})
		end,
	}
}
