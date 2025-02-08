return {
	-- Completion Engine
	-- { "hrsh7th/nvim-cmp",
	--    dependencies = {
	--      "hrsh7th/cmp-nvim-lsp",    -- LSP completion source
	--    },
	-- },
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lsp = require("lspconfig")
			lsp.lua_ls.setup({})
			-- Setup Clangd
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
