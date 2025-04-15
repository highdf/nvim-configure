return {
	{
		"lervag/vimtex",
		lazy = false,     -- we don't want to lazy load VimTeX

		init = function()
			vim.g.vimtex_quickfix_mode = 0
			vim.g.vimtex_view_method = "zathura"
			vim.g.tex_flavor = 'latex'
			vim.g.vimtex_compiler_method = 'latexmk'
		end,

		keys = {
			{ "<A-l>l", mode = "n", "<cmd>VimtexClean<enter>", desc = "Clean tex files"},
			{ "<A-l>o", mode = "n", "<cmd>VimtexCompile<enter>", desc = "Compile tex files"},
			{ "<A-l>i", mode = "n", "<cmd>VimtexView<enter>", desc = "View tex files"},
		},
	}
}
