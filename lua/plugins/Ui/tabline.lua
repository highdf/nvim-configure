return {
	-- 标签栏美化
	{
		'kdheepak/tabline.nvim',
		event = "VeryLazy",

		config = function()
			require'tabline'.setup {
				-- Defaults configuration options
				enable = true,
				options = {
					section_separators = {'', ''},
					component_separators = {'', ''},
					max_bufferline_percent = 66, -- 缓存区的占比
					show_tabs_always = false,  
					show_devicons = true, -- 显示图标
					show_bufnr = false, -- 禁止显示编号
					show_filename_only = true, -- 不显示相对路径
					modified_icon = "+ ",
					modified_italic = true, -- set to true by default; this determines whether the filename turns italic if modified
					show_tabs_only = false,
				}
			}
			vim.cmd[[
			set guioptions-=e " Use showtabline in gui vim
			set sessionoptions+=tabpages,globals " store tabpages and globals in session
			]]
		end,
		requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
	}
}
