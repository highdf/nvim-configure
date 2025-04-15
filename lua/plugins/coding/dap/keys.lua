local M = {}

M.dap_keys = {
  {
    "<F8>",
    function () require ("dap").continue () end,
    desc = "Run or continue debug",
  },
  {
    "<F9>",
    function () require ("dap").toggle_breakpoint () end,
    desc = "Toggle Breakpoint",
  },
  {
    "<F10>",
    function () require ("dap").step_into () end,
    desc = "Step into",
  },
  {
    "<F11>",
    function () require ("dap").step_over () end,
    desc = "Step over",
  },
  {
    "<F12>",
    function () require ("dap").step_out () end,
    desc = "Step out",
  },
  {
    "<A-d>b",
    function ()
      require ("dap").set_breakpoint (vim.fn.input ("Breakpoint condition: "))
    end,
    desc = "Set conditional breakpoint",
  },
  {
    "<A-d>a",
    function () require ("dap").continue ({ before = get_args }) end,
    desc = "Run debug with arguments",
  },
  {
    "<A-d>C",
    function () require ("dap").run_to_cursor () end,
    desc = "Run to cursor",
  },
  {
    "<A-d>g",
    function () require ("dap").goto_ () end,
    desc = "Jump to line (without executing)",
  },
  {
    "<A-d>j",
    function () require ("dap").down () end,
    desc = "Move down call stack",
  },
  {
    "<A-d>k",
    function () require ("dap").up () end,
    desc = "Move up call stack",
  },
  {
    "<A-d>l",
    function () require ("dap").run_last () end,
    desc = "Rerun last debug session",
  },
  {
    "<A-d>p",
    function () require ("dap").pause () end,
    desc = "Pause",
  },
  {
    "<A-d>r",
    function () require ("dap").repl.toggle () end,
    desc = "Toggle REPL console",
  },
  {
    "<A-d>s",
    function () require ("dap").session () end,
    desc = "View debug session",
  },
  {
    "<A-d>t",
    function () require ("dap").terminate () end,
    desc = "Terminate debug",
  },
  -- { "<A-d>w", function() require("dap.ui.widgets").hover() end, desc = "Show debug widgets" }
}

M.dap_ui_keys = {
  {
    "<A-d>e",
    mode = "n",
    "<cmd>lua require('dapui').toggle()<cr>",
    desc = "Open dap-ui window",
  },
  {
    "<A-d>w",
    mode = { "n", "v" },
    ":lua require('dapui').eval()<cr>",
    desc = "open dap-ui eval()",
  },
}

return M
