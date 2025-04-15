-- TODO
return {
  s (
    {
      trig = "us",
      dscr = {
        "Creates React useState hook with automatic setter name generation",
        "Format: const [state, setState] = useState(initialValue);",
        "",
        "Examples:",
        "- const [count, setCount] = useState(0);",
        "- const [name, setName] = useState('John');",
        "- const [todos, setTodos] = useState([]);",
        "",
      },
    },
    fmt ("const [{state}, {setter}] = useState<{state_type}>({init});", {
      state = i (1, "state"),
      setter = d (2, function (args)
        local state = args[1][1] or "state"
        return sn (
          nil,
          { t ("set" .. state:sub (1, 1):upper () .. state:sub (2)) }
        )
      end, { 1 }),
      state_type = i (3, "state_type"),
      init = i (4, "init_value"),
    })
  ),
  s (
    { trig = "fn" },
    fmt ("const {fn_name} = ({args}) => {{{body}}}", {
      fn_name = i (1, "fn_nameY"),
      args = i (2, "args"),
      body = i (3, "body"),
    })
  ),
  s (
    { trig = "ur" },
    fmt ("const {name}Ref = useRef<{ref_type}>(null)", {
      name = i (1, "name"),
      ref_type = i (2, "ref_type"),
    })
  ),
}
