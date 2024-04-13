return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"nvimdev/lspsaga.nvim",
		"nvim-telescope/telescope.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"folke/neodev.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities()

		local on_attach = function(client, bufnr)
			vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>")
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.declaration)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
			vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover)
		end

		require("neodev").setup({})
		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig.clangd.setup({
			on_attach = on_attach,
			capabilities = function()
				local capabilities = vim.lsp.protocol.make_client_capabilities()
				capabilities = require("cmp_nvim_lsp").default_capabilities()
				capabilities.offsetEncoding = { "utf-16" }
			end,
		})

		lspconfig.html.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig.cssls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig.tsserver.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,
}
