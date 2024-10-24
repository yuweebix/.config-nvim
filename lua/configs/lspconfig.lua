-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- LSP servers to be set up
local servers = { "gopls", "protols", "html", "cssls" }

-- Set up each LSP server with default configurations
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

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
        unreachable = true,
        nilness = true,
        shadow = true,
        unusedparams = true,
        unusedwrite = true,
        fieldalignment = true,
        nonewvars = true,
        useany = true,
      },
      staticcheck = true,
      gofumpt = true,
      usePlaceholders = true,
      completeUnimported = true,
      codelenses = {
        generate = true,
        gc_details = true,
        tidy = true,
      },
    },
  },
}

-- Setup Protols LSP for .proto files
lspconfig.protols.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "protols" },
  filetypes = { "proto" },
  root_dir = lspconfig.util.root_pattern ".proto",
}

-- Configure html-lsp for HTML files with htmx support
lspconfig.html.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    html = {
      format = {
        enable = true,
      },
      hover = {
        documentation = true,
        references = true,
      },
      css = {
        lint = {
          validProperties = { "htmx-*" },
        },
      },
    },
  },
}

-- Configure css-lsp for CSS files
lspconfig.cssls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
      },
    },
  },
}
