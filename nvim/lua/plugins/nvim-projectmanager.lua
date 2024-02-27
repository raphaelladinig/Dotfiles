return {
    dir = "~/Projects/nvim-projectmanager/",
    branch = "dev",
    config = function()
        require("projectmanager").setup({
            default_project_dir = "/home/raphael/Projects/",
        })
    end,
}
