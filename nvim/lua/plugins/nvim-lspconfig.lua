return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "nvimdev/lspsaga.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "nvim-telescope/telescope.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities()
        capabilities.offsetEncoding = { "utf-16" }

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = 'rounded',
        })

        local on_attach = function(client, bufnr)
            vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>")
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.declaration)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
            vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover)
        end

        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "jdtls",
                "clangd",
                "dockerls",
                "docker_compose_language_service",
                "html",
                "cssls",
                "tailwindcss",
                "tsserver",
                "emmet_language_server",
            },
        })

        mason_lspconfig.setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                    root_dir = function(fname)
                        return lspconfig.util.root_pattern(".git")(fname) or lspconfig.util.path.dirname(fname)
                    end,
                })
            end,

            ["jdtls"] = function() end, -- this is handled via nvim-jtdls
        })

        lspconfig.gdscript.setup({}) -- godot

        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end
    end,
}
