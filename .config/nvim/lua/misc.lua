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

-- update kitty theme on color scheme change (only base16-kitty)
if vim.env.TERM == "xterm-kitty" then
	vim.api.nvim_create_autocmd({ "ColorScheme" }, {
		callback = function()
			local cmd = "kitten @ --to %s set-colors -c "
				.. vim.env.HOME
				.. "/base16-kitty/colors/"
				.. vim.g.colors_name
				.. ".conf"
			local socket = vim.fn.expand("$KITTY_LISTEN_ON")

			vim.fn.system(cmd:format(socket))
		end,
	})
end

-- save theme to file
vim.api.nvim_create_autocmd({ "ColorScheme" }, {
	callback = function()
		local theme = vim.g.colors_name
		local file = vim.env.HOME .. "/.theme"
		local f, err = io.open(file, "w")
		if f then
			f:write(theme)
			f:close()
		else
			print("Failed to open file: " .. err)
		end
	end,
})

-- load theme from file
local theme_file = vim.fn.expand("$HOME") .. "/.theme"
if vim.fn.filereadable(theme_file) == 1 then
    local theme = vim.fn.system("cat " .. theme_file)
    if theme ~= "" then
        vim.cmd("colorscheme " .. theme)
    else
        vim.cmd("colorscheme default")
    end
else
    vim.cmd("colorscheme default")
end
