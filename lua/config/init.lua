require("config.basic") -- 基本配置
require("config.maps") -- 快捷键
require("config.lazy") -- Lazy配置

require("coding.lsp.init")
require("config.autocmd") -- 自动配置

local test = require("test.test")
test.test()
