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
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local data_dir = vim.fn.stdpath("data")

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
				command = data_dir .. "/mason/packages/codelldb/codelldb",
				args = { "--port", "13000" },
			},
		}

		dap.adapters.dart = {
			type = "executable",
			command = "dart",
			args = { "debug_adapter" },
		}

		dap.adapters.flutter = {
			type = "executable",
			command = "flutter",
			args = { "debug_adapter" },
		}

		dap.adapters.kotlin = {
			type = "executable",
			command = "kotlin-debug-adapter",
			options = { auto_continue_if_many_stopped = false },
		}

		dap.configurations.cpp = {
			{
				type = "codelldb",
				request = "launch",
				name = "default",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		require("dap-python").setup(data_dir .. "/mason/packages/debugpy/venv/bin/python")

		dap.configurations.dart = {
			{
				type = "dart",
				request = "launch",
				name = "Launch dart",
				program = "${workspaceFolder}/lib/main.dart",
				cwd = "${workspaceFolder}",
			},
			{
				type = "flutter",
				request = "launch",
				name = "Launch flutter",
				program = "${workspaceFolder}/lib/main.dart",
				cwd = "${workspaceFolder}",
			},
		}

		dap.configurations.kotlin = {
			{
				type = "kotlin",
				request = "launch",
				name = "Launch kotlin",
				mainClass = function()
					local root = vim.fs.find("src", { path = vim.uv.cwd(), upward = true, stop = vim.env.HOME })[1]
						or ""
					local fname = vim.api.nvim_buf_get_name(0)
					return fname:gsub(root, ""):gsub("main/kotlin/", ""):gsub(".kt", "Kt"):gsub("/", "."):sub(2, -1)
				end,
				projectRoot = "${workspaceFolder}",
				jsonLogFile = "",
				enableJsonLogging = false,
			},
		}

		require("dap.ext.vscode").load_launchjs("./launch.json", { codelldb = { "cpp" } })

		vim.keymap.set("n", "<leader>b", ":DapToggleBreakpoint<CR>")
		vim.keymap.set("n", "<leader>d", function()
			dapui.toggle()
		end)
		vim.keymap.set("n", "<leader>dr", function()
			dapui.open({ reset = true })
		end)
	end,
}
