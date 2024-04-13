return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzf-native.nvim",
		"nvim-tree/nvim-web-devicons",
		"BurntSushi/ripgrep",
	},
	config = function()
		require("telescope").setup({})
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", builtin.find_files)
		vim.keymap.set("n", "<leader>fb", builtin.buffers)
		vim.keymap.set("n", "<leader>fg", builtin.live_grep)
	end,
}
