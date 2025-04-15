return {
  -- 这个在shell文件中使用，var用于访问变量，ll用于生成function变量定义语句
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
