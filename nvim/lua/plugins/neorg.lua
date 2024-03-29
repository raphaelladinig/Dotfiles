return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
	},
	{
		"nvim-neorg/neorg",
		dependencies = { "luarocks.nvim" },
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {
						config = {
							folds = true,
							icon_preset = "diamond",
						},
					},
					["core.dirman"] = {
						config = {
							workspaces = {
								notes = "~/Notes",
							},
							default_workspace = "notes",
							index = "index.norg",
							use_popup = false,
						},
					},
					["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
					["core.integrations.nvim-cmp"] = {},
					["core.keybinds"] = {
						config = {
							default_keybinds = true,
							neorg_leader = "<Leader><Leader>",
						},
					},
				},
			})
		end,
	},
}
