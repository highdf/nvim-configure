local utils = require ("new-file-template.utils")

local function base_template (relative_path, filename)
  local content = ""
  local css = [[<link rel = "stylesheet" type = "text/css" href = "]]
    .. string.gsub (filename, "%.html", ".css")
    .. [[" />]]
  local javascript = [[<script src = "]]
    .. string.gsub (filename, "%.html", ".js")
    .. [["></script>]]

  return [[<!doctype html>

<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta
      content="width=device-width,initial-scale=1,user-scalable=no"
      name="viewport"
    />
    <meta name="description" content=" foo " />

    <link
      rel="stylesheet"
      type="text/css"
      href="/home/luky/Code/css/basic.css"
    />
    <link rel="stylesheet" type="text/css" href="a.css" />

    <title>foo</title>
  </head>

  <body>
    <header>foo</header>

    <script src="a.js"></script>
  </body>
</html>]]
end

--- @param opts table
---   A table containing the following fields:
---   - `full_path` (string): The full path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `relative_path` (string): The relative path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `filename` (string): The filename of the new file, e.g., "init.lua".
return function (opts)
  local template = {
    { pattern = ".*", content = base_template },
  }

  return utils.find_entry (template, opts)
end
