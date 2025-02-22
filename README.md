# neovim配置介绍

![empty][neovim-0]
![empty][neovim-1]

<!-- mtoc-start -->

* [准备](#准备)
* [目录结构](#目录结构)
* [init.lua](#initlua)
* [lua](#lua)
* [config](#config)
* [plugins](#plugins)
  * [Blink](#blink)
  * [Dap](#dap)
  * [Markdown](#markdown)
  * [Snacks](#snacks)
  * [Treesitter](#treesitter)
  * [Ui](#ui)
  * [Extras](#extras)

<!-- mtoc-end -->

## 准备
- [neovim下载地址](https://github.com/neovim/neovim/releases/tag/nightly)  
- [yazi下载地址](https://yazi-rs.github.io/docs/installation/)(必要)  
- [nerdfont字体下载地址](https://www.nerdfonts.com/font-downloads)(必要)   
- [kitty下载地址](https://sw.kovidgoyal.net/kitty/binary/#)(可选)  

## 目录结构
- 目录结构可查看`DIRCTORY.md`文件

## init.lua
- init.lua默认作为入口文件

## lua
- lua作为存放配置`config`与插件`plugins`的根目录

## config
- `maps.lua`定义了一些快捷键。  
- `autocmd.lua`定义的一些自动命令。  
- `basic.lua`定义的关于neovim的基本设置。  
- `lazy.lua`定义了lazy.nvim插件的行为，更详细的配置信息，请查看`lua/plugins/README.md`。  

## plugins
- `plugins`用于存放插件

### Blink
- 核心插件是`blink.cmp`,这是一个代码补全插件。  
- `lspconfig`和`mason`用于管理配置lsp服务和下载所需语言服务器。

### Dap
- 核心插件是`dap`，这是一个用于调试代码的插件。  
- `dap-ui`和`dap-text` 分别用于窗口美化与虚拟文本显示。  

### Markdown
- `rendermarkdown`用于实时预览`Markdown`文件。  
- `markdown`提供一些关于`markdown`文本的快捷操作。  
- `markdown-toc`提供了插入，更新，删除目录的快捷操作。  

### Snacks
- `snacks`是核心插件，提供了丰富且高效的功能。  
- `comment`实现的快捷的各类型文件的注释功能。  
- `fterm`提供了美观的浮动终端。  
- `yazi`是一个好用的文件浏览器。  
- `im-select`可以实现快速切换输入法
- `nvim-surround`是一个可以插入包裹符号的插件

### Treesitter
- `Treesitter`提供了各类型文件的语法高亮，增量选择，缩进功能的插件。  

### Ui
- `colorscheme`提供了一些颜色主体。  
- `lualine`是一个状态栏梅花插件。  
- `tabline`用来美化标签栏。  
- `noice`提供了命令行美化

### Extras
- 这个目录下，存放了一些额外的插件，若想使用只需取消文件注释即可。  

[neovim-0]: https://raw.githubusercontent.com/highdf/Picture/refs/heads/main/neovim/neovim-0.png
[neovim-1]: https://raw.githubusercontent.com/highdf/Picture/refs/heads/main/neovim/neovim-1.png
