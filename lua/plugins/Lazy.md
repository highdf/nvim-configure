# Lazy.nvim配置规范

## 配置字段详解
| 字段名        | 类型         | 必要性 | 描述                                                                 | 示例                                                                 | 注意事项                                                                 |
|---------------|--------------|--------|----------------------------------------------------------------------|----------------------------------------------------------------------|--------------------------------------------------------------------------|
| `url`         | String       | 必填   | 插件仓库地址                                                         | `'saghen/blink.cmp'`                                                | 支持 GitHub 简写格式                                                     |
| `version`     | String       | 可选   | 指定插件版本                                                         | `version = 'v1.8.0'`                                                | `'*'` 表示最新版本，推荐生产环境使用固定版本                              |
| `event`       | String/Array | 可选   | 触发加载的事件                                                       | `event = {"BufReadPost", "BufNewFile"}`                              | [完整事件列表](https://github.com/folke/lazy.nvim#-event)                 |
| `dependencies`| Array        | 可选   | 插件依赖项                                                           | `dependencies = {'nvim-lua/plenary.nvim'}`                          | 依赖插件会先于主插件加载                                                 |
| `build`       | String       | 可选   | 安装/更新时执行的命令                                                | `build = ":TSUpdate"`                                               | 支持多命令：`build = {"make", "cmake .."}`                               |
| `keys`        | Array        | 可选   | 快捷键绑定配置                                                       | `keys = {{"<leader>ff", "<cmd>Telescope find_files<cr>", desc = "文件搜索"}}` | 支持模式过滤：`mode = "n"` (n=普通, i=插入, v=可视, t=终端)              |
| `opts`        | Table        | 可选   | 自定义配置参数                                                       | `opts = {line_numbers = false}`                                     | 会与插件默认配置深度合并                                                 |
| `config`      | Function     | 可选   | 插件初始化函数                                                       | `config = function() require('plugin').setup({}) end`               | 推荐在此调用 setup() 函数                                               |

## 配置示例说明

### 基础配置
```lua
{
  'folke/trouble.nvim',
  version = 'v3.0.0',
  dependencies = {'nvim-tree/nvim-web-devicons'},
  event = 'BufRead',
  config = function()
    require('trouble').setup{}
  end
}
