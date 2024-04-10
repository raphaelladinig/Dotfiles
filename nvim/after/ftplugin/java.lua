local jdtls = require("jdtls")

local bundles = {
    vim.fn.glob(
        "~/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-0.50.0.jar",
        1
    ),
}
vim.list_extend(
    bundles,
    vim.split(vim.fn.glob("~/.local/share/nvim/mason/packages/java-test/extension/server/*.jar", 1), "\n")
)

local capabilities = vim.lsp.protocol.make_client_capabilities()

local on_attach = function(client, bufnr)
    vim.keymap.set("n", "<leader>e", "<cmd>Telescope diagnostics bufnr=0<CR>")
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.declaration)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
    vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover)
    require("jdtls.dap").setup_dap_main_class_configs()
end

local config = {
    cmd = { vim.fn.expand("~/.local/share/nvim/mason/packages/jdtls/bin/jdtls") },
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = jdtls.setup.find_root({ ".git", "mvnw" }),
    init_options = {
        bundles = bundles,
    },
}

jdtls.start_or_attach(config)
