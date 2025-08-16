vim.lsp.config['luals'] = {
  cmd = {'lua-language-server'},
  filetypes = {'lua'},
}
vim.lsp.config['clangd'] = {
  cmd = {'clangd'},
  filetypes = {'c', 'cpp', 'cuda'},
}
vim.lsp.config['pyright'] = {
  cmd = {'pyright-langserver', '--stdio'},
  filetypes = {'python'},
}
vim.lsp.enable({'luals', 'pyright', 'clangd'})
