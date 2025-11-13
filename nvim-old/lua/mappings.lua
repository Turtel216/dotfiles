require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle breakpoint" })
map("n", "<leader>dbn", "<cmd> DapStepOver <CR>", { desc = "Skip to next break point" })
map("n", "<leader>dbs",
  function()
    local widgets = require('dap.ui.widgets');
    local sidebar = widgets.sidebar(widgets.scopes);
    sidebar.open()
  end,
  { desc = "Open debugging sidebar" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
