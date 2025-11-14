return {
  {
    "mfussenegger/nvim-dap",
    dependencies = { "williamboman/mason.nvim" },
    opts = function(_, opts)
      local mason = vim.fn.stdpath("data") .. "/mason/packages/codelldb/"
      local codelldb = mason .. "extension/adapter/codelldb"

      opts.adapters = opts.adapters or {}
      opts.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = codelldb,
        },
      }

      opts.configurations = opts.configurations or {}
      opts.configurations.cpp = {
        {
          name = "Launch C++ executable",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }
    end,
  },
}
