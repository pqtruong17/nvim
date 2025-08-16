vim.cmd [[set completeopt+=menuone,noselect,popup]]

local on_attach = function(client, bufnr)
  vim.lsp.completion.enable(true, client.id, bufnr, {
    autotrigger = true,
    convert = function(item)
      return { abbr = item.label:gsub('%b()', '') }
    end,
  })
  vim.keymap.set('i', '<c-space>', function()
    vim.lsp.completion.get()
  end)
  end

vim.lsp.config['luals'] = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  on_attach = on_attach
}

vim.lsp.config['pyright'] = {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python', 'py' },
  on_attach = on_attach
}

vim.lsp.config['clangd'] = {
  cmd = { 'clangd' },
  filetypes = { 'c', 'cu', 'cpp' },
  on_attach = on_attach
}

vim.lsp.enable({ 'clangd', 'luals', 'pyright' })

vim.diagnostic.config({
  virtual_text = true,
})
