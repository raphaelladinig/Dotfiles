return {
	"folke/trouble.nvim",
	branch = "dev",
	config = function()
		require("trouble").setup({})

		vim.keymap.set("n", "<leader>D", "<cmd>Trouble diagnostics toggle<cr>")
	end,
}
