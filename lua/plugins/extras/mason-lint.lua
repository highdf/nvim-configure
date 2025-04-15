return {
  --   {
  --     "williamboman/mason.nvim",
  --     "mfussenegger/nvim-lint",
  --     "rshkarin/mason-nvim-lint",
  --
  --     config = function ()
  --       require ("mason-nvim-lint").setup ({
  --         ensure_installed = { "bacon" },
  --         -- bacon linter for rust is not available in nvim-lint, so it's specified to be directly installed from the mason's registry
  --         ignore_install = { "custom-linter" },
  --         -- avoid trying to install an unknown linter
  --       })
  --     end,
  --   },
}
