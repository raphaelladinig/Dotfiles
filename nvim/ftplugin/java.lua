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
    vim.keymap.set("n", "<leader>d", "<cmd>Telescope diagnostics bufnr=0<CR>")
    vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>")
    vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>")
    vim.keymap.set("n", "<leader>gD", "<cmd>Lspsaga goto_definition<CR>")
    vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>")
    vim.keymap.set("n", "<leader>k", "<cmd>Lspsaga hover_doc<CR>")
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
