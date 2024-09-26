local options = {
  formatters_by_ft = {
    proto = { "buf" }, -- Use buf for formatting
    lua = { "stylua" },
    go = { "gopls", "gofumpt", "goimports", "goimports-reviser", "golines" },
  },

  linters_by_ft = {
    proto = { "buf" }, -- Use buf for linting
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
