return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			dependencies = {
				"folke/neodev.nvim",
				"nvim-neotest/nvim-nio",
			},
		},
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("nvim-dap-virtual-text").setup({})
		require("neodev").setup({
			library = { plugins = { "nvim-dap-ui" }, types = true },
		})
		dapui.setup()

		dap.adapters.codelldb = {
			type = "server",
			port = "13000",
			host = "127.0.0.1",
			executable = {
				command = "/home/raphael/.local/share/nvim/mason/packages/codelldb/codelldb",
				args = { "--port", "13000" },
			},
		}

		require("dap.ext.vscode").load_launchjs("./launch.json")

		dap.configurations.cpp = dap.configurations.codelldb

		dap.adapters.godot = {
			type = "server",
			host = "127.0.0.1",
			port = 6006,
		}

		dap.configurations.gdscript = {
			{
				type = "godot",
				request = "launch",
				name = "Launch scene",
				project = "${workspaceFolder}",
				launch_scene = true,
			},
		}

		vim.keymap.set("n", "<leader>b", ":DapToggleBreakpoint<CR>")
		vim.keymap.set("n", "<leader>d", function()
			dapui.toggle()
		end)
		vim.keymap.set("n", "<leader>dr", function()
			dapui.open({ reset = true })
		end)
	end,
}
