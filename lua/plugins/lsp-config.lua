return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ensure_installed = { "lua_ls", "clangd", "jedi-language-server" },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "pylsp", "basedpyright" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lsp = require("lspconfig")
      lsp.lua_ls.setup({})
      lsp.pylsp.setup({
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                ignore = { "W391" },
                maxLineLength = 150,
              },
            },
          },
        },
      })

      require("lspconfig").basedpyright.setup({
        settings = {
          basedpyright = {
            analysis = {
              useLibraryCodeForTypes = true,
              typeCheckingMode = "basic",
              diagnosticMode = "workspace",
              autoSearchPath = true,
              inlayHints = {
                callArgumentNames = true,
              },
              extraPaths = {
                "...",
                "...",
              },
            },
            python = {
              venvPath = "/path/to/venv",
              venv = "venv",
            },
          },
        },
      })

      lsp.clangd.setup({
        cmd = {
          "C://MinGW//bin//clangd.exe",
          "--query-driver=C://MinGW//bin//g++.exe",
          "--clang-tidy",
          "--background-index",
          "--completion-style=detailed",
        },
        filetypes = { "c", "cpp", "objc", "objcpp" },
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
