return {
  s (

    "var",
    fmt ("${{{}}}", {
      i (1, "variable name"),
    })
  ),
  s (
    "ll",
    fmt ("local {variable_name}={value}", {
      variable_name = i (1, "variable_name"),
      value = i (2, "value"),
    })
  ),
}
