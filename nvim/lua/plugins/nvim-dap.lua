return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "williamboman/mason.nvim",
        "jay-babu/mason-nvim-dap.nvim",
        {
            "rcarriga/nvim-dap-ui",
            dependencies = {
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
		})

        require("nvim-dap-virtual-text").setup({})

        require("neodev").setup({
            library = { plugins = { "nvim-dap-ui" }, types = true },
        })
        dapui.setup({})

        vim.keymap.set("n", "<leader>b", ":DapToggleBreakpoint<CR>")
        vim.keymap.set("n", "<leader>d", function()
            dapui.toggle()
        end)
        vim.keymap.set("n", "<leader>dr", function()
            dapui.open({ reset = true })
        end)
    end,
}
