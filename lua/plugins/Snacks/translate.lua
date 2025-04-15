return {
	"voldikss/vim-translator",
	keys = {
		{ "<leader>tl", mode = { "n", "v" }, ":TranslateW<cr>", desc = "翻译结果" },
		{ "<leader>tr", mode = { "n", "v" }, ":TranslateR<cr>", desc = "替换为翻译" },
	},

	config = function()
		-- 基础配置
		vim.g.translator_default_engines = { "google", "youdao" }
		vim.g.translator_window_type = "popup"

		vim.g.translator_default_mapping = 0

		vim.g.translator_proxy_url = "http://127.0.0.1:7890"  -- Clash 默认 HTTP 代理端口
		vim.g.translator_history_enable = true  -- 启用翻译历史
	end
}
