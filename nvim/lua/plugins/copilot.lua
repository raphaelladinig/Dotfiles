return {
	"github/copilot.vim",
	event = "InsertEnter",
	config = function()
		vim.keymap.set("i", "<C-c>", 'copilot#Accept("")', {
			expr = true,
			replace_keycodes = false,
		})
		vim.g.copilot_no_tab_map = true
		vim.g.copilot_filetypes = {
			["*"] = false,
			["cpp"] = true,
			["java"] = true,
		}
	end,
}
