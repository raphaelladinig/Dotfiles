return {
    "NeogitOrg/neogit",
    branch = "nightly",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local neogit = require("neogit")
        neogit.setup({})
    end,
}
