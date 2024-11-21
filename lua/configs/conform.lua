local options = {
  formatters_by_ft = {
    proto = { "buf" },
    lua = { "stylua" },
    go = { "gopls", "gofumpt", "goimports", "goimports-reviser", "golines" },
    templ = { "templ" },
  },

  linters_by_ft = {
    proto = { "buf" },
    templ = { "templ" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}
return options
