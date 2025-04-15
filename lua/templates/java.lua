local utils = require ("new-file-template.utils")

local function genenrateClassName (filename)
  return filename:gsub ("%.java", "") .. " "
end

local function generatePackStat (relative_path)
  local package_stat = ""

  if relative_path ~= "." then
    local package_path = relative_path:gsub (".*/java/", ""):gsub ("/", ".")
    package_stat = "package " .. package_path .. ";"
  end

  return package_stat
end

local function code (
  package_stat,
  classType,
  className,
  postSymbol,
  symbolName
)
  return table.concat ({
    package_stat .. "\n",
    "\n",
    "public " .. classType,
    className,
    postSymbol,
    symbolName .. "{\n",
    "\t|cursor|\n",
    "}",
  }, "")
end

local function base_template (relative_path, filename)
  return code (
    generatePackStat (relative_path),
    "class ",
    genenrateClassName (filename),
    "",
    ""
  )
end

local function inter_template (relative_path, filename)
  return code (
    generatePackStat (relative_path),
    "interface ",
    genenrateClassName (filename),
    "",
    ""
  )
end

local function impl_template (relative_path, filename)
  local className = genenrateClassName (filename)
  local package_stat = generatePackStat (relative_path)
  local implName = className:gsub ("Impl", "")

  return code (package_stat, "class ", className, "implements ", implName)
end

local function enum_template (relative_path, filename)
  return code (
    generatePackStat (relative_path) .. " ",
    "enum ",
    genenrateClassName (filename) .. " ",
    "",
    ""
  )
end

--- @param opts table
---   A table containing the following fields:
---   - `full_path` (string): The full path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `relative_path` (string): The relative path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `filename` (string): The filename of the new file, e.g., "init.lua".
return function (opts)
  local template = {
    -- { pattern = ".*Enum%.java", content = enum_template },
    -- { pattern = ".*Impl%.java", content = impl_template },
    -- { pattern = ".*Dao%.java", content = inter_template },
    -- { pattern = ".*Service%.java", content = inter_template },
    { pattern = ".*", content = base_template },
  }

  return utils.find_entry (template, opts)
end
