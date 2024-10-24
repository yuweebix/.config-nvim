local options = {
  formatters_by_ft = {
    proto = { "buf" }, -- Use buf for formatting
    lua = { "stylua" },
    go = { "gopls", "gofumpt", "goimports", "goimports-reviser", "golines" },
    html = { "prettier" }, -- Add prettier for HTML formatting
    css = { "prettier" }, -- Add prettier for CSS formatting
  },

  linters_by_ft = {
    proto = { "buf" }, -- Use buf for linting
    html = { "eslint" }, -- Add eslint for HTML linting
    css = { "stylelint" }, -- Add stylelint for CSS linting
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
