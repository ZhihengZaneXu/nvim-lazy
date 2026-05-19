return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"python",
					"javascript",
					"html",
					"css",
					"markdown",
					"markdown_inline", -- noice / docs / hover popups
					"bash", -- shell scripts, .zshrc, etc.
					"json", -- lazy-lock.json, configs
				},
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					disable = { "latex" },
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
			})
		end,
	},
}
