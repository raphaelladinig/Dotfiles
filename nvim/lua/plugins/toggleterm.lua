return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({})
		vim.keymap.set({ "n", "i", "v", "x", "t" }, "<C-t>", "<CMD>ToggleTerm<CR>", { noremap = true, silent = true })
	end,
}
