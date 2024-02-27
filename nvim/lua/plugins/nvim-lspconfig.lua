return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"nvimdev/lspsaga.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"nvim-telescope/telescope.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities()
		capabilities.offsetEncoding = { "utf-16" }

		local on_attach = function(client, bufnr)
			vim.keymap.set("n", "<leader>d", "<cmd>Telescope diagnostics bufnr=0<CR>")
			vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>")
			vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>")
			vim.keymap.set("n", "<leader>gD", "<cmd>Lspsaga goto_definition<CR>")
			vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>")
			vim.keymap.set("n", "<leader>k", "<cmd>Lspsaga hover_doc<CR>")
		end

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
			},
		})

		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					on_attach = on_attach,
					capabilities = capabilities,
					root_dir = function(fname)
						return lspconfig.util.root_pattern(".git")(fname) or lspconfig.util.path.dirname(fname)
					end,
				})
			end,

			["jdtls"] = function() end, -- this is handled via nvim-jtdls
		})

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end
	end,
}
