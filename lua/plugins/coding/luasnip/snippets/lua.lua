return {
  s ({
    trig = "rq",
    dscr = {
      "Creates Lua module import statements with three different formats:",
      "",
      "1. Simple require: require 'module_name'",
      "   - Directly imports module without assignment",
      "",
      "2. Local assignment with parentheses: local mod = require('path')",
      "   - Creates local variable from module path",
      "   - Uses require() with parentheses syntax",
      "",
      "3. Smart local assignment: local mod = require 'path'",
      "   - Automatically generates variable name from module path",
      "   - For 'utils.helpers' -> variable becomes 'utils_helpers'",
      "   - For 'config' -> variable becomes 'config'",
      "",
    },
  }, {
    c (1, {
      fmt ("require '{mod_name}'", {
        mod_name = i (1, "mod_name"),
      }),
      fmt ("local {mod_name} = require({mod_path})", {
        mod_path = i (1, "mod_path"),
        mod_name = i (2, "mod_name"),
      }),
      fmt ("local {mod_name} = require '{mod_path}'", {
        mod_path = i (1, "mod_name"),
        mod_name = f (function (args)
          local ret = "variable_name"
          local parts = vim.split (args[1][1], ".", { plain = true })
          for i, _ in ipairs (parts) do
            if parts[i] == "" then table.remove (parts, i) end
          end

          if #parts == 1 then
            ret = parts[1]
          elseif #parts > 1 then
            ret = parts[#parts - 1] .. "_" .. parts[#parts]
          end

          return ret
        end, { 1 }),
      }),
    }),
  }),
}
