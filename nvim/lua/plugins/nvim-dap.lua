return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		{
			"rcarriga/nvim-dap-ui",
			dependencies = {
				"mfussenegger/nvim-dap",
				"folke/neodev.nvim",
			},
		},
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local mason_nvim_dap = require("mason-nvim-dap")

		mason_nvim_dap.setup({
			ensure_installed = {},
			handlers = {
				function(config)
					mason_nvim_dap.default_setup(config)
				end,
			},
		})

		require("nvim-dap-virtual-text").setup({})

		require("neodev").setup({
			library = { plugins = { "nvim-dap-ui" }, types = true },
		})
		dapui.setup({})

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)

		vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>")
		vim.keymap.set("n", "<leader>dc", ":DapContinue<CR>")
	end,
}
