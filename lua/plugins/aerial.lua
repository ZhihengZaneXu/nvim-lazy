return {
	{
		"stevearc/aerial.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("aerial").setup({
				backends = { "lsp", "treesitter", "markdown" }, -- sources for symbols
				layout = {
					default_direction = "right", -- put outline on the right
					placement = "window", -- outline is window-local
				},
				attach_mode = "global", -- one outline for all buffers
				show_guides = true, -- indent guides in outline
			})
		end,
	},
}
