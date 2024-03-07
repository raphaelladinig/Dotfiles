return {
	"zbirenbaum/copilot.lua",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<C-c>",
                    next = "<C-j>",
					prev = "<C-k>",
				},
			},
			filetypes = {
				["vim"] = true,
				["lua"] = true,
				["cpp"] = true,
                ["java"] = true,
				["*"] = false,
			},
		})
	end,
}
