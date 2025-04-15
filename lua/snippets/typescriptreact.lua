-- TODO
return {
  s (
    "us",
    fmt ("const [{state}, {setter}] = useState({init});", {
      state = i (1, "state"),
      setter = d (2, function (args)
        local state = args[1][1] or "state"
        return sn (
          nil,
          { t ("set" .. state:sub (1, 1):upper () .. state:sub (2)) }
        )
      end, { 1 }),
      init = i (3, "init_value"),
    })
  ),
}
