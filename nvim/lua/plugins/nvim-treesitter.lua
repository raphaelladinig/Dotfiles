return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
		"nvim-treesitter/nvim-treesitter-context",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"cpp",
				"java",
				"css",
				"html",
				"javascript",
			},
			auto_install = false,
			sync_install = true,
			ignore_install = {},
			modules = {},
			highlights = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<Leader>ss",
					node_incremental = "<Leader>si",
					scope_incremental = "<Leader>sc",
					node_decremental = "<Leader>sd",
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
					},
					selection_modes = {
						["@parameter.outer"] = "v",
						["@function.outer"] = "V",
					},
					include_surrounding_whitespace = true,
				},
			},
			autotag = {
				enable = true,
			},
		})
		require("treesitter-context").setup({
			max_lines = 2,
		})
	end,
}
