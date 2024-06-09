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

-- update kitty theme on color scheme change (only catppuccin)
if vim.env.TERM == "xterm-kitty" then
	vim.api.nvim_create_autocmd({ "ColorScheme" }, {
		callback = function()
			local theme = vim.g.colors_name

			if theme:match("^catppuccin") then
				local socket_files = io.popen("ls /tmp/kitty-*")

				if socket_files == nil then
					print("No kitty sockets found")
					return
				end

				local cmd = "kitten @ --to unix:%s"
					.. " set-colors -a -c "
					.. vim.env.HOME
					.. "/.config/kitty/themes/"
					.. vim.g.colors_name
					.. ".conf"

				for socket_file in socket_files:lines() do
					vim.fn.system(cmd:format(socket_file))
				end

				socket_files:close()
			end
		end,
	})
end

local theme_file = vim.fn.expand("$HOME") .. "/.flavour"

vim.api.nvim_create_autocmd({ "ColorScheme" }, {
	callback = function()
		local theme = vim.g.colors_name

		if theme:match("^catppuccin") then
			local f, err = io.open(theme_file, "w")
			if f then
				f:write(theme)
				f:close()
			else
				print("Failed to open file: " .. err)
			end
		end
	end,
})

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
