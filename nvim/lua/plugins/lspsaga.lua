return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lspsaga").setup({
			ui = {
				code_action = "",
			},
			diagnostic = {
				diagnostic_only_current = true,
			},
		})
		vim.keymap.set("n", "<leader>t", "<cmd>Lspsaga term_toggle<CR>")
	end,
}
