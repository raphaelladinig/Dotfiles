return {
	"folke/zen-mode.nvim",
	config = function()
		require("zen-mode").setup({
			window = {
				backdrop = 0.90,
				width = 120,
				height = 1,
			},
			plugins = {
				options = {
					enabled = true,
					laststatus = 0,
				},
				gitsigns = { enabled = true },
				tmux = { enabled = true },
			},
		})
		vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", {})
	end,
}
