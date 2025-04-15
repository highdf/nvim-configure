return {
	-- 作用：生成包裹符号
	{  -- 智能环绕符号操作插件 (增/删/改包围符号)
		"kylechui/nvim-surround",
		version = "*",  -- 使用稳定版（推荐生产环境）
		event = { "BufRead", "InsertEnter" },  -- 文件读取或插入模式时加载

		config = function()
			require("nvim-surround").setup()  -- 默认配置包含以下核心功能：
			-- 1. 可视化模式快速添加包围符 (ys)
			-- 2. 删除包围符 (ds)
			-- 3. 修改包围符 (cs)
			-- 4. 支持多种符号类型：引号、括号、HTML标签等
			-- 5. 智能上下文感知（自动补全/缩进处理）
		end
	}
}
