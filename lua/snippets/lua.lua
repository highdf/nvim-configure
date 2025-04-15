-- TODO fn, function definite expand
return {
  s (
    "rq",
    fmt ("require '{mod_name}'", {
      mod_name = i (1, "mod_name"),
    })
  ),
  s (
    "lrq",
    fmt ("local {val} = require ( '{mod_name}' )", {
      mod_name = i (1, "mod_name"),
      val = f (function (args)
        local ret = ""
        local parts = vim.split (args[1][1], ".", { plain = true })
        for i, _ in ipairs (parts) do
          if parts[i] == "" then table.remove (parts, i) end
        end

        if #parts == 1 then
          ret = parts[1]
        else
          ret = parts[1] .. "_" .. parts[#parts]
        end
        return ret
      end, { 1 }),
    })
  ),
}
