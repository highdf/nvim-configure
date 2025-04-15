local util = require ("conform.util")
local format_utll = require ("plugins.coding.conform.util")

local config_file_name = "clang-format"
local config_path = format_utll.project_path (config_file_name)

local ft = {
  "c",
  "java",
  "cpp",
  "cs",
}

---@type conform.FileFormatterConfig
return {
  meta = {
    url = "https://clang.llvm.org/docs/ClangFormat.html",
    description = "Tool to format C/C++/… code according to a set of rules and heuristics.",
  },
  ft = ft,
  command = "clang-format",
  args = { "-assume-filename", "$FILENAME", "-style=file:" .. config_path },
  range_args = function (self, ctx)
    local start_offset, end_offset =
      util.get_offsets_from_range (ctx.buf, ctx.range)
    local length = end_offset - start_offset
    return {
      "-assume-filename",
      "$FILENAME",
      "--offset",
      tostring (start_offset),
      "--length",
      tostring (length),
    }
  end,
}
