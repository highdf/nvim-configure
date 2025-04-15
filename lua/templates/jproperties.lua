local utils = require("new-file-template.utils")

local function jdbc_template(relative_path, filename)
	return [[driverClassName=org.mariadb.jdbc.Driver
url=jdbc:mariadb://127.0.0.1/|cursor|
username=luky
password=275365]]
end

--- @param opts table
---   A table containing the following fields:
---   - `full_path` (string): The full path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `relative_path` (string): The relative path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `filename` (string): The filename of the new file, e.g., "init.lua".
return function(opts)
  local template = {
    { pattern = "^jdbc%.properties$", content = jdbc_template },
    -- { pattern = "jdbc%.properties", content = jdbc_template },
  }

	return utils.find_entry(template, opts)
end
