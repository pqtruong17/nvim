function _G.cleverTab()
  local col = vim.fn.col('.')-1
  local line = vim.fn.getline('.')
  local before_cursor = line:sub(1,col)
  if before_cursor:match('^%s*$') then
    return '\t'
  else
    return vim.api.nvim_replace_termcodes('<C-n>', true, true, true)
  end
end

vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.cleverTab()', {expr = true, noremap = true})
