return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
			},
			show_end_of_buffer = true,
		})
	end,
}
