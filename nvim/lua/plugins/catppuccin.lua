return {
	"catppuccin/nvim",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			styles = {
				comments = { "italic" },
				types = { "italic" },
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
