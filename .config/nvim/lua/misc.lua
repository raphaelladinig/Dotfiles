vim.api.nvim_create_autocmd({ "VimEnter", "WinEnter", "BufWinEnter" }, {
	callback = function()
		vim.opt_local.cursorline = true
	end,
})

vim.api.nvim_create_autocmd({ "WinLeave" }, {
	callback = function()
		vim.opt_local.cursorline = false
	end,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.diagnostic.config({
	virtual_text = false,
})

local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- update kitty theme
if vim.env.TERM == "xterm-kitty" then
	vim.api.nvim_create_autocmd({ "ColorScheme" }, {
		callback = function()
			local cmd = "kitty @ --to %s set-colors -c "
				.. vim.env.HOME
				.. "/base16-kitty/colors/"
				.. vim.g.colors_name
				.. ".conf"
			local socket = vim.fn.expand("$KITTY_LISTEN_ON")

			vim.fn.system(cmd:format(socket))
		end,
	})
end
