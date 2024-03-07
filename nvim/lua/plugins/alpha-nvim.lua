return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")


		dashboard.section.header.val = "NeoVim"

		dashboard.section.buttons.val = {
			dashboard.button("c", "Create Project", ":PMCreateProject<CR>"),
			dashboard.button("p", "Open Project", ":PMProjects<CR>"),
			dashboard.button("n", "Notes", ":Neorg workspace notes<CR>"),
			dashboard.button("s", "School", ":Neorg workspace school<CR>"),
			dashboard.button("l", "Lazy", ":Lazy<CR>"),
			dashboard.button("m", "Mason", ":Mason<CR>"),
		}

		alpha.setup(dashboard.opts)
	end,
}
