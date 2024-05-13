return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		local jdtls = require("jdtls")
		local data_dir = vim.fn.stdpath("data")
		local bundles = {
			vim.fn.glob(
				data_dir
					.. "/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-0.50.0.jar",
				1
			),
		}
		vim.list_extend(
			bundles,
			vim.split(vim.fn.glob(data_dir .. "/mason/packages/java-test/extension/server/*.jar", 1), "\n")
		)

		local capabilities = vim.lsp.protocol.make_client_capabilities()

		local on_attach = function(client, bufnr)
			vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>")
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.declaration)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
			vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover)

			require("jdtls.dap").setup_dap_main_class_configs()
		end

		local config = {
			cmd = { vim.fn.expand(data_dir .. "/mason/packages/jdtls/bin/jdtls") },
			on_attach = on_attach,
			capabilities = capabilities,
			root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew" }),
			init_options = {
				bundles = bundles,
			},
		}

		vim.api.nvim_create_autocmd({ "FileType" }, {
			pattern = { "java" },
			callback = function()
				jdtls.start_or_attach(config)
			end,
		})
	end,
}
