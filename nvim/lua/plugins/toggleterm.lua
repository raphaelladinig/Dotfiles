return {
	"akinsho/toggleterm.nvim",
	opts = {},
	config = function()
		vim.keymap.set({ "n", "i", "v", "x", "t" }, "<C-t>", "<CMD>ToggleTerm<CR>", { noremap = true, silent = true })
	end,
}
