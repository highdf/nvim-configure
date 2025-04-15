return {
  s (
    {
      trig = "var",
      dscr = {
        "Creates shell variable access syntax with curly braces",
        "Format: ${variable_name}",
        "",
        "Examples:",
        "- `echo ${USER}`",
        "- `cp ${source_file} ${dest_dir}`",
        "- `${variable}_suffix`",
        "",
      },
    },
    fmt ('"${{{}}}"', {
      i (1, "variable name"),
    })
  ),

  s (
    {
      trig = "pl",
    },
    fmt ("System.out.println({args});", {
      args = i (1, "args"),
    })
  ),
  s (
    { trig = "pvf" },
    fmt ("private {type_name} {field_name};", {
      type_name = i (1, "type_name"),
      field_name = i (2, "field_name"),
    })
  ),
}
