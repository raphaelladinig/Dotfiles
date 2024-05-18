return {
	"zbirenbaum/copilot.lua",
	config = function()
		require("copilot").setup({
			suggestion = {
				keymap = {
					accept = "<C-c>",
					next = "<C-j>",
					prev = "<C-k>",
				},
			},
		})
	end,
}
