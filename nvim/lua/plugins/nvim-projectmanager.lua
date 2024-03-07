return {
	-- "raphaelladinig/nvim-projectmanager",
	dir = "/home/raphael/Projects/nvim-projectmanager/",
	config = function()
		require("projectmanager").setup({
			default_project_dir = "/home/raphael/Projects/",
			template_dir = "/home/raphael/Projects/templates/",
		})
		require("telescope").load_extension("projectmanager")
	end,
}
