### 🚀 Neovim 环境配置

![Neovim界面预览][neovim-0]
![插件功能演示][neovim-1]

#### 环境准备
| 组件名称 | 必要性 | 描述 | 下载地址 |
|----------|--------|------|----------|
| Neovim Nightly | 必要 | 编辑器本体 | [下载地址](https://github.com/neovim/neovim/releases/tag/nightly) |
| Nerd Font | 必要 | 图标字体支持 | [字体列表](https://www.nerdfonts.com/font-downloads) |
| Yazi | 推荐 | 现代化文件管理 | [安装指南](https://yazi-rs.github.io/docs/installation/) |
| Kitty | 可选 | GPU加速终端 | [下载地址](https://sw.kovidgoyal.net/kitty/binary/#) |


# Neovim 插件

| 模块          | 插件文件               | 对应插件                          | 核心功能描述             | 插件地址    |
|---------------|------------------------|-----------------------------------|--------------------------|-------------|
| **Blink**     | `blink.lua`            | saghen/blink.cmp                 | 增强代码补全             | [blink-cmp] |
|               | `lspconfig.lua`        | neovim/nvim-lspconfig            | LSP协议配置中心          | [lsp-config]|
| **Dap**       | `dap.lua`              | mfussenegger/nvim-dap            | 调试协议核心实现         | [nvim-dap]  |
|               | `dap-ui.lua`           | rcarriga/nvim-dap-ui             | 可视化调试界面           | [dap-ui]    |
| **Markdown**  | `markdown-preview.lua` | iamcco/markdown-preview.nvim     | 实时预览渲染器           | [md-preview]|
|               | `vim-markdown-toc.lua` | mzlogin/vim-markdown-toc         | Markdown目录生成器       | [md-toc]    |
|               | `render-markdown.lua` | MeanderingProgrammer/render-markdown.nvim         | Markdown实时预览       | [render-md]    |
| **Snacks**    | `snacks.lua`           | folke/snacks.nvim                | 效率增强工作台           | [snacks]    |
|               | `toggleterm.lua`       | akinsho/toggleterm.nvim          | 浮动终端管理             | [toggleterm]|
|               | `yazi.lua`             | mikavilpas/yazi.nvim             | 现代化文件管理           | [yazi]      |
| **Treesitter**| `treesitter.lua`       | nvim-treesitter/nvim-treesitter  | 语法解析引擎             | [treesitter]|
| **UI**        | `colorscheme.lua`      | catppuccin/nvim                  | 柔光主题套装             | [catppuccin]|
|               | `lualine.lua`          | nvim-lualine/lualine.nvim        | 动态状态栏               | [lualine]   |
|               | `tabline.lua`          | kdheepak/tabline.nvim            | 智能标签栏               | [tabline]   |
|               | `noice.lua`            | folke/noice.nvim                 | 交互式通知系统           | [noice]     |
| **Extras**    | `flash.lua`            | folke/flash.nvim                 | 快速跳转工具             | [flash]     |
|               | `im-select.lua`        | h-hg/fcitx.nvim                  | 输入法状态管理           | [fcitx]     |
|               | `mason.lua`            | williamboman/mason.nvim          | LSP管理器                | [mason]     |

[blink-cmp]: https://github.com/saghen/blink.cmp
[lsp-config]: https://github.com/neovim/nvim-lspconfig
[nvim-dap]: https://github.com/mfussenegger/nvim-dap
[dap-ui]: https://github.com/rcarriga/nvim-dap-ui
[md-preview]: https://github.com/iamcco/markdown-preview.nvim
[md-toc]: https://github.com/mzlogin/vim-markdown-toc
[snacks]: https://github.com/folke/snacks.nvim
[render-md]: https://github.com/MeanderingProgrammer/render-markdown.nvim
[toggleterm]: https://github.com/akinsho/toggleterm.nvim
[yazi]: https://github.com/mikavilpas/yazi.nvim
[treesitter]: https://github.com/nvim-treesitter/nvim-treesitter
[catppuccin]: https://github.com/catppuccin/nvim
[lualine]: https://github.com/nvim-lualine/lualine.nvim
[tabline]: https://github.com/kdheepak/tabline.nvim
[noice]: https://github.com/folke/noice.nvim
[flash]: https://github.com/folke/flash.nvim
[fcitx]: https://github.com/h-hg/fcitx.nvim
[mason]: https://github.com/williamboman/mason.nvim


[neovim-0]: https://raw.githubusercontent.com/highdf/Picture/refs/heads/main/neovim/neovim-0.png
[neovim-1]: https://raw.githubusercontent.com/highdf/Picture/refs/heads/main/neovim/neovim-1.png
