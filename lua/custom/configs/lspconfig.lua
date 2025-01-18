local base = require("plugins.configs.lspconfig")

local on_attach = base.on_attach
local capabilies = base.capabilities

local lspconfig = require("lspconfig")

lspconfig.clangd.setup {
  cmd = { "clangd"},
  filetypes = { "c","cpp"},
  root_dir =require("lspconfig").util.root_pattern("compile_commands.json", ".git"),
  settings = {
    clangd = {
      fallbackFlags = {
        "-std = c++20",
      },
    },
  },
  on_attach = function (client, bufnr) client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilies = capabilies,
}
