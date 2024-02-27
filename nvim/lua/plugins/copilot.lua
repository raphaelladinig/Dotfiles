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
			["lua"] = true,
			["java"] = true,
			["html"] = true,
			["css"] = true,
			["js"] = true,
			["php"] = true,
			["json"] = true,
		}
	end,
}
