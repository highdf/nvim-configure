local format_util = require("utils.format_util")

local config_name = "tex-fmt.toml"
local config_path = format_util.project_config_path .. config_name

---@type conform.FileFormatterConfig
return {
	meta = {
		url = "https://github.com/WGUNDERWOOD/tex-fmt",
		description = "An extremely fast LaTeX formatter written in Rust.",
	},
	command = "tex-fmt",
	-- args = { "-s", "--config", config_path },
	args = { "-s", "--config=" .. config_path },
}
