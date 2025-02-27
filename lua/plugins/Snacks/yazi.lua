return {
	-- 作用：高效的文件浏览器
	-- yazi下载网站：https://yazi-rs.github.io/docs/installation/
	-- 该插件依赖yazi，所以，yazi必须安装
	{
		"mikavilpas/yazi.nvim",
		verson = false,
		lazy = true,

		keys = {
			{
				"<leader>y",
				"<cmd>Yazi toggle<cr>",
				desc = "Resume the last yazi session",
			},
			-- {
			-- 	"<leader>yc",
			-- 	"<cmd>execute 'cd ' . @+<cr>",
			-- 	desc = "change work directory",
			-- },
		},
		opts = {
			open_for_directories = flase,
			keymaps = {
				show_help = "<f1>",
			},
		},
    }
}
