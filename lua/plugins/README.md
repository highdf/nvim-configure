# Lazy.nvim配置规范

<!-- mtoc-start -->

* [url ](#url-)
* [version](#version)
* [event](#event)
* [dependencies](#dependencies)
* [bliud](#bliud)
* [keys](#keys)
* [opts](#opts)
* [config](#config)

<!-- mtoc-end -->

## url 
`url`字段用于制定要下载插件的github地址,例：  

```lua
{
    'saghen/blink.cmp',
}
```
表示下载`'saghen/blink.cmp'`插件

## version
`version`字段可以指定要下载插件的版本，其中`version = '*'`表示下载最新版。

## event
`event`字段定义了加载事件：  

- `VeryLazy`表示尽可能的晚加载  
- `InsertEnter`在插入缓冲区时加载
- `FileType`根据指定文件类型加载
- `CmdlineEneter`在进入命令行模式时加载  
- `UIEnter`在UI初始化时加载  

`lazy.nvim`还提供了更多的事件，读者使用`知乎直答`或`DeepSeek`查看  

## dependencies
`dependencies`可以指定某个插件的依赖项，`lazy.nvim`会保证能依赖项会在主插件加载之前加载它们，例：  

```lua
    'saghen/blink.cmp',
    dependencies =  {
        'rafamadriz/friendly-snippets',
    },
```
`lazy.nvim` 将在加载`blink.cmp`之前加载`friendly-snippets`。  

## bliud
`bliud`指定在插件第一次安装或更新时，要执行的命令，例：

```lua
    build = ":TSUpdate",
```
在安装或更新`treesitter`时，将执行`Update`操作。  

## keys
`keys`字段用于自定义快捷键，定义格式是：

- `key`指定使用的触发键
- `mode`指定触发键适用的模式，其中"n","i","v"分别表示普通，插入，可视模式
- `opt`指定触发键对应的命令
- `desc`用于提供对快捷键的描述

例如：
```lua
    keys = {
        {"<leader>mp",mode = {"n"},":MarkdownPreviewToggle<enter>";desc = "view markdown"},
    },
```
其中`<leader>mp`是触发键，`mode`指定普通模式，`:MarkdownPreviewToggle<enter>`指定触发的命令。

## opts
opts字段用于自定义插件的配置或者覆盖默认配置，例：
```lua
    opts = {
        keymap = {
            preset = 'default' ,
        },
    }
```
在这个例子中，自定义的`keymap`字段。

## config
`config`字段用于调用插件的setup函数，初始化插件，例：
```lua
    config = function()
        require("im_select").setup({})
    end,
```
初始化`im_select`插件。
