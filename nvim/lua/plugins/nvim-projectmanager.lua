return {
	-- "raphaelladinig/nvim-projectmanager",
	dir = "/home/raphael/Dev/nvim-projectmanager/",
	config = function()
		require("projectmanager").setup({
			default_project_dir = "/home/raphael/Dev/",
			template_dir = "/home/raphael/Templates",
		})
		require("telescope").load_extension("projectmanager")
	end,
}
