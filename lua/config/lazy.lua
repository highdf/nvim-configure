-----------------------------------------
-- Lazy.nvim 初始化配置
-- 文档：https://lazy.folke.io
--
-- 核心特性：
-- 1. 基于事件驱动的延迟加载机制
-- 2. 并行加载优化启动速度
-- 3. 支持版本锁定和自动更新检查
-----------------------------------------

-- 检测并自动安装 Lazy.nvim
-- 使用 Neovim 标准数据路径 (stdpath("data")) 确保跨平台兼容性
local lazypath = vim.fn.stdpath ("data") .. "/lazy/lazy.nvim"

-- 使用 vim.uv (Neovim 0.10+) 或 vim.loop 兼容旧版本
if not (vim.uv or vim.loop).fs_stat (lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"

  -- 优化克隆参数：
  -- --filter=blob:none   : 仅克隆元数据，节省带宽
  -- --single-branch      : 只克隆 stable 分支
  local out = vim.fn.system ({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })

  -- 错误处理流程
  if vim.v.shell_error ~= 0 then
    -- 使用多段落错误提示
    vim.api.nvim_echo ({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" }, -- 显示原始错误输出
      { "\nPress any key to exit...", "MoreMsg" },
    }, true, {}) -- 第二个 true 参数表示覆盖模式

    vim.fn.getchar () -- 阻塞等待用户输入
    os.exit (1) -- 非零状态码退出
  end
end

-- 调整运行时路径优先级
-- prepend 确保 lazy.nvim 优先加载
vim.opt.rtp:prepend (lazypath)

-----------------------------------------
-- Lazy 核心配置
-----------------------------------------
require ("lazy").setup ({
  -- 模块化插件配置 (推荐目录结构)
  spec = {
    { import = "plugins.ui" }, -- 用户界面增强
    { import = "plugins.coding" }, -- 语法高亮系统
    { import = "plugins.writing" }, -- 实用工具集合
    { import = "plugins.utils" }, -- 快速导航插件
  },

  -- 全局默认配置
  defaults = {
    lazy = false, -- 禁用延迟加载（某些插件需要立即初始化）
    -- version = "*", -- 隐式使用最新版本（显式版本锁定示例："2.1.0"）
  },

  -- 安装配置
  install = {
    colorscheme = { "catppuccin" }, -- 安装完成后自动设置主题
    -- missing = true,  -- 自动安装缺失的插件 (默认已启用)
  },

  -- 更新检查配置
  checker = {
    enabled = true, -- 启用定期更新检查（默认每周检查）
    frequency = 604800, -- 检查间隔秒数 (7天)
    notify = false, -- 禁用更新通知弹窗
    -- concurrency = 10, -- 并行检查数量
  },

  -- 性能优化配置
  performance = {
    cache = { enabled = true }, -- 启用插件缓存
    rtp = {
      disabled_plugins = { -- 禁用不常用内置插件
        "gzip", -- 压缩文件支持
        -- "matchit",            -- 保留 % 符号匹配
        -- "matchparen",         -- 保留括号匹配
        "netrwPlugin", -- 替代方案：nvim-tree 或 oil.nvim
        "tarPlugin", -- tar 文件支持
        "tohtml", -- 代码转 HTML
        "tutor", -- Neovim 教程
        "zipPlugin", -- zip 文件支持
      },
      paths = nil, -- 可添加自定义运行时路径
    },
  },

  -- 调试配置（可选）
  -- debug = {
  --   profile = {
  --     enable = true,
  --     threshold = 1 -- 记录超过 1ms 的加载事件
  --   }
  -- }
})

-----------------------------------------
-- 注意事项：
-- 1. 禁用内置插件可能导致依赖问题，例如：
--    - 禁用 netrwPlugin 后需安装文件管理器插件
-- 2. lazy=false 会影响启动速度，建议：
--    - 对必要插件启用 lazy=false
--    - 其他插件使用 event/ft 等条件延迟加载
-- 3. 版本锁定示例：
--    { "folke/lazy.nvim", version = "2.2.0" }
-- 4. 推荐目录结构：
--    ~/.config/nvim/lua/plugins/
--    ├── Ui.lua
--    ├── Treesitter.lua
--    └── ...
-----------------------------------------
