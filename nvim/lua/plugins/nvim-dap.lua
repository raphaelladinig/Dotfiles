return {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		dependencies = {
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
		},
		config = function()
			local dap = require("dap")
			local mason_nvim_dap = require("mason-nvim-dap")

			mason_nvim_dap.setup({
				ensure_installed = {
				},
				handlers = {
					function(config)
						mason_nvim_dap.default_setup(config)
					end,
				},
			})

			vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>")
			vim.keymap.set("n", "<leader>dc", ":DapContinue<CR>")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"folke/neodev.nvim",
		},
		config = function()
			local dapui = require("dapui")

			require("neodev").setup({
				library = { plugins = { "nvim-dap-ui" }, types = true },
			})

			dapui.setup({})

			vim.keymap.set("n", "<leader>da", function()
				dapui.toggle({})
			end)
		end,
	},
}
