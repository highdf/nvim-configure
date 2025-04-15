local format_util = require ("utils.format_util")
local base_path = format_util.project_config_path
local config_path = base_path .. "yamlfmt.yaml"

---@type conform.FileFormatterConfig
return {
    meta = {
        url = "https://github.com/google/yamlfmt",
        description = "yamlfmt is an extensible command line tool or library to format yaml files.",
    },
    command = "yamlfmt",
    args = { "$FILENAME", "-conf", config_path },
}
