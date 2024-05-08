return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {}

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end)
	end,
}
