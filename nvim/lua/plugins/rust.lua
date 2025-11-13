return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- latest stable major version
    ft = { "rust" },
    config = function()
      vim.g.rustaceanvim = {
        tools = {
          executor = "toggleterm",
        },
        server = {
          settings = {
            ["rust-analyzer"] = {
              cargo = { allFeatures = true },
              procMacro = { enable = true },
            },
          },
        },
      }
    end,
  },
}
