local dap = require("dap")

dap.adapters.codelldb = {
	type = "server",
	port = "13000",
	host = "127.0.0.1",
	executable = {
		command = "/home/raphael/.local/share/nvim/mason/packages/codelldb/codelldb",
		args = { "--port", "13000" },
	},
}

dap.configurations.cpp = {
	{
		name = "default",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}

require("dap.ext.vscode").load_launchjs("./launch.json", { codelldb = { "cpp" } })
