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

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, {
        autotrigger = false,
        convert = function(item)
          return { abbr = item.label:gsub('%b()', '')}
        end,
        vim.keymap.set('i', '<c-space>', function() vim.lsp.completion.get() end)
      })
    end
    -- local log_path = vim.fn.getcwd() .. "/test.log"
    -- local log_file = io.open(log_path, "w")
    -- log_file:write("LSP client attached: " .. client.name .. "/\n")
    -- log_file:write("hello world!/\n")
    -- log_file:close()
  end,
})
