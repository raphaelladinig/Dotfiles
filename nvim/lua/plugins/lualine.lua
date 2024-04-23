return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				section_separators = "",
				component_separators = "|",
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					"mode",
				},
				lualine_b = {
					"progress",
				},
				lualine_c = {
					"diagnostics",
				},
				lualine_x = {
					"diff",
					"branch",
				},
				lualine_y = {
					"filename",
				},
				lualine_z = {
					"tabs",
				},
			},
		})
	end,
}
