return {
  {
    "nvim-lua/plenary.nvim",

    {
      "nvchad/ui",
      config = function()
        require "nvchad"
      end,
    },

    {
      "nvchad/base46",
      lazy = true,
      build = function()
        require("base46").load_all_highlights()
      end,
    },

    "nvchad/volt", -- optional, needed for theme switcher

    "edluffy/hologram.nvim",
    config = function()
      require("hologram").setup { auto_display = true }
    end,
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "mfussenegger/nvim-dap",
    config = function()
      require "mappings" -- Load mappings for dap
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require "mappings" -- Load mappings for dap-go
    end,
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "go",
        "proto",
      },
    },
  },
}
