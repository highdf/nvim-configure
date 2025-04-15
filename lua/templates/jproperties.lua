local utils = require("new-file-template.utils")

local function druid_template(relative_path, filename)
	local driverClassName = "org.mariadb.jdbc.Driver"
	local db_host = "127.0.0.1"
	local db_user = "luky"
	local db_password = "275365"
	local db_server_name = "mariadb"
	local db_name = "test"

	return table.concat({
		"driverClassName=" .. driverClassName,
		"url=jdbc:" .. db_server_name .. "://" .. db_host .. "/" .. db_name,
		"username=" .. db_user,
		"password=" .. db_password,
		"initialSize=5",
		"maxActive=10",
		"maxWait=3000"
	}, "\n") .. "\n"  -- 末尾添加空行
end

--- @param opts table
---   A table containing the following fields:
---   - `full_path` (string): The full path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `relative_path` (string): The relative path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `filename` (string): The filename of the new file, e.g., "init.lua".
return function(opts)
  local template = {
    { pattern = "^druid%.properties", content = druid_template },
  }

	return utils.find_entry(template, opts)
end
