return {
	"raddari/last-color.nvim",
	config = function()
		local theme = require("last-color").recall() or "default"
		vim.cmd(("colorscheme %s"):format(theme))
	end,
}
