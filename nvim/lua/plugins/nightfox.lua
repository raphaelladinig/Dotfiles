return {
	-- "EdenEast/nightfox.nvim",
    dir = "/home/raphael/Dev/nightfox.nvim",
	priority = 1000,
	config = function()
		require("nightfox").setup({
			options = {
                styles = {
					keyword = "italic",
					types = "italic",
				},
			},
		})
		vim.cmd("colorscheme carbonfox")
	end,
}
