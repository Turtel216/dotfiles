return {
  {
    "mfussenegger/nvim-dap",
    dependencies = { "theHamsta/nvim-dap-virtual-text" },
    config = function()
      local dap = require("dap")
      dap.adapters.cppdbg = {
        id = "cppdbg",
        type = "executable",
        command = "/usr/bin/gdb", -- or lldb-vscode on macOS
      }
      dap.configurations.c = {
        {
          name = "Launch C Program",
          type = "cppdbg",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", "./a.out", "file")
          end,
          cwd = "${workspaceFolder}",
          stopAtEntry = false,
        },
      }
    end,
  },
}
