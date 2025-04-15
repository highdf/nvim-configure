local utils = require ("new-file-template.utils")

local function base_template (relative_path, filename)
    return [[<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta
            content="width=device-width,initial-scale=1,user-scalable=no"
            name="viewport"
        />
        <meta name="description" content=" foo " />

        <title> foo </title>
    </head>

    <body>
        <header> foo </header>

        <main> foo </main>
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
