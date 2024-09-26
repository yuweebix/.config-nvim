-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "gopls", "protols" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps withinh default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
--
-- Configure gopls with extended settings
lspconfig.gopls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod" },
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unreachable = true, -- Report unreachable code
        nilness = true, -- Check for redundant or impossible nil comparisons
        shadow = true, -- Detect shadowed variables
        unusedparams = true, -- Find unused parameters
        unusedwrite = true, -- Detect unused writes to variables
        fieldalignment = true, -- Suggest optimizations for struct field alignment
        nonewvars = true, -- Highlight variables that could be redeclared
        useany = true, -- Flag unnecessary uses of the "any" type
      },
      staticcheck = true, -- Enable static analysis checks
      gofumpt = true, -- Use gofumpt for formatting
      usePlaceholders = true, -- Use placeholders for function signatures
      completeUnimported = true, -- Autocomplete unimported packages
      codelenses = {
        generate = true, -- Enable the `go generate` lens
        gc_details = true, -- Enable the `go gc` lens
        tidy = true, -- Enable the `go mod tidy` lens
      },
    },
  },
}

-- Setup Protols LSP for .proto files
lspconfig.protols.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "protols" }, -- Ensures protols command is used
  filetypes = { "proto" }, -- .proto files
  root_dir = lspconfig.util.root_pattern ".proto", -- Set root directory for proto files
}
