require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

-- Remap navigation keys
map({ "n", "v" }, "i", "k", { desc = "Move up" })
map({ "n", "v" }, "j", "h", { desc = "Move left" })
map({ "n", "v" }, "k", "j", { desc = "Move down" })
map({ "n", "v" }, "l", "l", { desc = "Move right" })

-- Remap navigation keys in insert mode using Ctrl
map("i", "<C-i>", "<Up>", { desc = "Move up" })
map("i", "<C-j>", "<Left>", { desc = "Move left" })
map("i", "<C-k>", "<Down>", { desc = "Move down" })
map("i", "<C-l>", "<Right>", { desc = "Move right" })

-- Additional insert mode navigation keys
map("i", "<C-h>", "<Home>", { desc = "Move to the beginning of the line" })

-- Remap insert mode key
map("n", "h", "i", { desc = "Enter insert mode" })
map("n", "H", "I", { desc = "Move to the front of the line" })

-- CMD enter command mode
map("n", ";", ":", { desc = "Enter command mode" })

-- Escaping insert mode with 'jk'
map("i", "jk", "<ESC>")

-- Save with Ctrl + s in normal, visual, and insert mode
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", { desc = "Save file" })

-- Unmap the mapping for <A-i> in normal and terminal mode
nomap({ "n", "t" }, "<A-i>")

-- DAP mappings
map("n", "<leader>dp", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
map("n", "<leader>dni", "<cmd> DapStepOver <CR>", { desc = "Dap Step Over" })
map("n", "<leader>dno", "<cmd> DapStepInto <CR>", { desc = "Dap Step Into" })
map("n", "<leader>dnu", "<cmd> DapStepOut <CR>", { desc = "Dap Ste Out" })
map("n", "<leader>dus", function()
  local widgets = require "dap.ui.widgets"
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = "Open debugging sidebar" })

-- DAP Go mappings
map("n", "<leader>dgt", function()
  require("dap-go").debug_test()
end, { desc = "Debug go test" })
map("n", "<leader>dgl", function()
  require("dap-go").debug_last()
end, { desc = "Debug last go test" })

-- Mapping delete commands to the blackhole register
map({ "n", "v" }, "d", '"_d')
map({ "n", "v" }, "D", '"_D')
map({ "n", "v" }, "dd", '"_dd')

-- Mapping change commands to the blackhole register
map({ "n", "v" }, "c", '"_c')
map({ "n", "v" }, "C", '"_C')
map({ "n", "v" }, "cc", '"_cc')

-- Mapping other change and delete related commands
map({ "n", "v" }, "x", '"_x')
map({ "n", "v" }, "X", '"_X')
