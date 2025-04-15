return {
    {
        "NyxVim/nvim-colorizer.lua",
        event = "BufRead",

        config = function ()
            require ("colorizer").setup ({
                filetypes = {
                    "html",
                    "css",
                    "conf",
                    "javascript",
                    "typescript",
                    lua = { -- 注意这里是表的形式
                        RGB = true,
                        RRGGBB = true,
                        names = false, -- lua 文件中不显示颜色名
                        mode = "virtualtext",
                    },
                    python = { -- 再为 python 文件设置不同的配置
                        RGB = true,
                        RRGGBB = true,
                        names = true,
                        css_fn = true,
                        mode = "background",
                    },
                },
                user_default_options = {
                    RGB = true, -- #RGB hex codes
                    RRGGBB = true, -- #RRGGBB hex codes
                    names = true, -- "Name" codes like Blue or blue
                    RRGGBBAA = false, -- #RRGGBBAA hex codes
                    AARRGGBB = false, -- 0xAARRGGBB hex codes
                    rgb_fn = true, -- CSS rgb() and rgba() functions
                    hsl_fn = true, -- CSS hsl() and hsla() functions
                    css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                    css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
                    mode = "virtualtext", -- Set the display mode.
                    tailwind = false, -- Enable tailwind colors
                    sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
                    virtualtext = "",
                    always_update = false,
                },
                buftypes = {},
            })
        end,
    },
}
