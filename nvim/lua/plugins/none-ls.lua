return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"jay-babu/mason-null-ls.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local mason_null_ls = require("mason-null-ls")

		mason_null_ls.setup({
			ensure_installed = {
				"stylua",
                "clang-format",
                "prettier",
			},
			handlers = {
				function(source_name, methods)
					mason_null_ls.default_setup(source_name, methods)
				end,
			},
		})

		null_ls.setup({})

		vim.keymap.set("n", "<leader>mp", vim.lsp.buf.format)
	end,
}
