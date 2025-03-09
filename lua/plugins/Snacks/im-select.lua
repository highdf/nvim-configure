return {
	-- 作痛：可以快速切换输入法
	{
		"keaising/im-select.nvim",
		event = "VimEnter",

		config = function()
			require('im_select').setup({
				-- -- IBus 英文输入法标识符 (通过终端执行 `ibus list-engine` 确认)
				default_im_select = "xkb:us::eng", 
				--
				-- -- 事件触发配置
				-- set_default_events = {
				-- 	"VimEnter",      -- 启动时强制英文
				-- 	"FocusGained",   -- 窗口重新聚焦时校准
				-- 	"InsertLeave",   -- 退出插入模式切英文
				-- 	"CmdlineLeave"   -- 退出命令行模式切英文
				-- },
				--
				-- -- 进入插入模式时恢复上一次输入法
				-- set_previous_events = { "InsertEnter" },
				--
				-- -- 依赖缺失时显示警告
				-- keep_quiet_on_no_binary = false,
				--
				-- 异步切换提升性能
				async_switch_im = true
			})
		end,
	}
}
