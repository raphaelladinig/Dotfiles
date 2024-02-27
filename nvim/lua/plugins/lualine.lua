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
				disabled_filetypes = {
					"alpha",
				},
			},
			sections = {
				lualine_a = {
					{
						"mode",
						separator = { right = "" },
						draw_empty = true,
					},
				},
				lualine_b = {},
				lualine_c = { "diagnostics" },
				lualine_x = { "branch", "diff" },
				lualine_y = {},
				lualine_z = {
					{
						"location",
						separator = { left = "" },
						draw_empty = true,
					},
					{
						"progress",
						draw_empty = true,
					},
				},
			},
		})
	end,
}
