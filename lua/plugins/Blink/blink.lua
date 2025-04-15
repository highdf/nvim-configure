return {
  -- blink.cmp 主插件配置 (用于增强Neovim自动补全)
  {
    'saghen/blink.cmp',
    dependencies = {               -- 依赖管理
      'rafamadriz/friendly-snippets',  -- 代码片段支持
      'echasnovski/mini.icons', version = '*'  -- 图标显示
    },
    version = '*',                 -- 使用最新稳定版
    event = "InsertEnter",         -- 插入模式时加载

    opts = {                       -- 插件配置项
      keymap = {                   -- 快捷键映射
        preset = 'default'         -- 使用VSCode风格快捷键
      },

      appearance = {              -- 视觉设置
        use_nvim_cmp_as_default = true,  -- 继承nvim-cmp样式
        nerd_font_variant = 'mono' -- 使用等宽图标字体
      },

      sources = {                  -- 补全源配置
        default = {                -- 默认补全源组合
          'lsp',      -- 语言服务器协议
          'path',     -- 文件路径
          'snippets', -- 代码片段
          'buffer',   -- 缓冲区内容
        },
      },

      cmdline = {                  -- 命令行补全
        enabled = false            -- 禁用命令行补全功能
      },      

      fuzzy = {                    -- 模糊匹配设置
        implementation = "prefer_rust_with_warning"  -- 使用Rust实现
      },
      
      completion = {               -- 补全行为配置
        accept = {                 -- 接受补全后的行为
          auto_brackets = {        -- 自动括号
            enabled = false       -- 禁用自动添加括号
          },
        },
        menu = {                   -- 补全菜单样式
          min_width = 15,          -- 最小宽度
          max_height = 15,         -- 最大高度
          winblend = 0,           -- 不透明度（0-100）
          border = 'single',       -- 边框样式
          draw = {                 -- 自定义绘制
            treesitter = { "lsp" },-- 使用Treesitter
            components = {         -- 组件配置
              kind_icon = {        -- 类型图标设置
                ellipsis = false, -- 禁用省略号
                text = function(ctx)  -- 动态获取图标
                  local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                  return kind_icon
                end,
                highlight = function(ctx)  -- 图标高亮
                  local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                  return hl
                end,
              }
            }
          },
        },
        documentation = {          -- 文档说明窗口
          window = { border = 'single' },  -- 边框样式
          auto_show = true,        -- 自动显示文档
          auto_show_delay_ms = 200 -- 显示延迟(毫秒)
        },
      },
      signature = { window = { border = 'single' } },  -- 函数签名提示
    },
    opts_extend = { "sources.default" },  -- 扩展默认补全源
  },
}
