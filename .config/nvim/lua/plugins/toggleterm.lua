return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			start_in_insert = false, -- HACK: because of barbecue
		})

		vim.keymap.set({ "n", "i", "v", "x", "t" }, "<C-t>", "<CMD>ToggleTerm<CR>", { noremap = true, silent = true })
		vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
		vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]])
	end,
}
