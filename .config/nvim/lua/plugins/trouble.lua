return {
	"folke/trouble.nvim",
	branch = "dev",
	config = function()
		require("trouble").setup({})

		vim.keymap.set("n", "<leader>t", "<cmd>Trouble diagnostics toggle<cr>")
	end,
}
