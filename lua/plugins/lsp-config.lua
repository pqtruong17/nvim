local servers = { "lua_ls", "clangd", "pylsp"}

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ensure_installed = servers,
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = servers,
      })
    end,
  },
  {
  "neovim/nvim-lspconfig",
    config = function()
      -- turn servers on
      vim.lsp.enable(servers)
      -- Lsp completion 
      vim.api.nvim_create_autocmd('LspAttach', {
        callback  = function(args)
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
          if client:supports_method('textDocument/completion') then 
            vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = false})
            -- Clever tab to auto non-lsp local term
            vim.keymap.set('i', '<Tab>', 
            function()
              local col = vim.fn.col('.') - 1
              local line = vim.fn.getline('.')
              local before_cursor = line:sub(1,col)
              if before_cursor:match('^%s*S') then
                return '\t'
              else 
                return vim.api.nvim_replace_termcodes('<C-n>', true, true, true)
              end
            end, {expr = true, noremap = true})
            -- ctr-space to auto-complete lsp term
            vim.keymap.set('i', '<c-space>',
              function() 
                vim.lsp.completion.get()
              end, {buffer = args.buf, noremap = true})
          end
        end
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.diagnostic.config({
        virtual_text = true,
        virtual_line = true,
      })
    end,
  },
}
