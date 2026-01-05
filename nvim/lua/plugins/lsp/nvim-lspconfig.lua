return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason.nvim",
		"mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim"
	},
	config = function()
		require("mason").setup()

		local servers = {
			"basedpyright",
			"bashls",
			"clangd",
			"fish_lsp",
			"jsonls",
			"lua_ls",
			"rust_analyzer",
			"solidity", -- vscode-solidity-server
		}

		require("mason-lspconfig").setup({
			ensure_installed = servers,
			-- Disable automatic setup to prevent "InvalidParams" crash
			automatic_enable = false,
		})

		-- 1. APPLY FIX: Custom config for Solidity
		-- This forces the JSON object {} instead of array []
		vim.lsp.config('solidity', {
			init_options = vim.empty_dict(),
			root_markers = { "foundry.toml", "hardhat.config.js", "hardhat.config.ts", ".git" },
		})

		-- 2. ENABLE ALL LANGUAGES
		-- This one command activates all servers in your list
		vim.lsp.enable(servers)

		-- 3. Modern Keymaps (Standard for 2025)
		vim.api.nvim_create_autocmd('LspAttach', {
			callback = function(args)
				local opts = { buffer = args.buf }
				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
				vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
			end,
		})
	end,
}
