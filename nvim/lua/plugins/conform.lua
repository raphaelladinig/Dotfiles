return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				cpp = { "clang-format" },
				html = { "prettier" },
				css = { "prettier" },
				javascript = { "prettier" },
				json = { "prettier" },
				markdown = { "prettier" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})

		vim.keymap.set("n", "<leader>mp", function()
			conform.format()
		end)
	end,
}
