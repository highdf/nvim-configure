-- 欢迎来到neovim --
-- 这是neovim的入口文件，require用来引入config目录下的子模块

-- ******************** --
require("config.basic")			-- 基本配置
require("config.maps")			-- 快捷键
require("config.lazy")			-- Lazy配置
require("config.autocmd")		-- 自动配置
