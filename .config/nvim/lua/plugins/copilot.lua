return {
	{
		"zbirenbaum/copilot.lua",
		config = function()
			require("copilot").setup({
				suggestion = {
					keymap = {
						accept = "<C-c>",
						next = "<C-j>",
						prev = "<C-k>",
					},
                    auto_trigger = true
				},
			})
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			"zbirenbaum/copilot.lua",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("CopilotChat").setup()
		end,
	},
}
