return {
	"lervag/vimtex",
	lazy = false,
	init = function()
		-- Use Tectonic for clean, modern compilation
		vim.g.vimtex_compiler_method = "tectonic"
		vim.g.vimtex_compiler_tectonic = {
			executable = "tectonic",
			options = {
				"%f", -- just compile, no aux/log
			},
		}

		-- Zathura for preview
		vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_view_general_viewer = "zathura"
		vim.g.vimtex_view_general_options = "--synctex-forward @line:@col:@tex @pdf"
	end,
}
