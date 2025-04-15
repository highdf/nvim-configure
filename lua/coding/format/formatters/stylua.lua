local util = require ("conform.util")

local format_util = require ("utils.format_util")
local config_name = "stylua.toml"
local config_path = format_util.project_config_path .. config_name

---@type conform.FileFormatterConfig
return {
    meta = {
        url = "https://github.com/JohnnyMorganz/StyLua",
        description = "An opinionated code formatter for Lua.",
    },
    command = "stylua",
    args = {
        "--search-parent-directories",
        "--respect-ignores",
        "--stdin-filepath",
        "$FILENAME",
        "-",
        "--config-path",
        config_path,
    },
    range_args = function (self, ctx)
        local start_offset, end_offset =
            util.get_offsets_from_range (ctx.buf, ctx.range)
        return {
            "--search-parent-directories",
            "--stdin-filepath",
            "$FILENAME",
            "--range-start",
            tostring (start_offset),
            "--range-end",
            tostring (end_offset),
            "-",
        }
    end,
    cwd = util.root_file ({
        ".stylua.toml",
        "stylua.toml",
    }),
}
