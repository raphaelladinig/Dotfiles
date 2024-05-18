-- TODO: keybinds
return {
	"folke/trouble.nvim",
	branch = "dev",
	config = function()
		require("trouble").setup({})

		vim.keymap.set("n", "<leader>t", "<cmd>Trouble<cr>")
	end,
}
