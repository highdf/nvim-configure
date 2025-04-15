return {
	{  -- LSP诊断行内显示插件配置
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		lazy = false,  -- 立即加载（诊断功能需全局生效）

		config = function()
			-- 插件基础配置
			require("lsp_lines").setup({
				highlight_hovered_item = true,    -- 悬停时高亮诊断项
				show_diagnostic_source = true     -- 显示诊断来源（如eslint、pylint）
			})

			-- 全局诊断显示设置
			vim.diagnostic.config({
				virtual_text = false,  -- 禁用传统悬浮式诊断文本
				virtual_lines = {      -- 启用行内虚拟线诊断
					only_current_line = true,    -- 仅当前行显示诊断线
					highlight_whole_line = false -- 不高亮整行背景
				},
				underline = true,     -- 保留错误下划线
				signs = true,         -- 保留左侧标记符号
				update_in_insert = false  -- 插入模式不更新诊断（避免干扰）
			})
		end
	}
}
