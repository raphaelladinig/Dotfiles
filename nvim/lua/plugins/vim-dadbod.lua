return {
	"tpope/vim-dadbod",
	event = "VeryLazy",
	dependencies = {
		"kristijanhusak/vim-dadbod-ui",
		init = function()
			vim.g.db_ui_winwidth = 30
			vim.g.db_ui_show_help = 0
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
}
