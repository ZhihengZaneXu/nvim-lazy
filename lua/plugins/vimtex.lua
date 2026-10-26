return {
	"lervag/vimtex",
	lazy = false,
	init = function()
		-- Use Tectonic for clean, modern compilation
		vim.g.vimtex_compiler_method = "tectonic"
		vim.g.vimtex_compiler_tectonic = {
			executable = "tectonic",
			options = {
              "--keep-logs",
              "--synctex",
			},
		}

		-- Zathura for preview
		vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_view_general_viewer = "zathura"
		vim.g.vimtex_view_general_options = "--synctex-forward @line:@col:@tex @pdf"

      -- Tectonic has no continuous mode, so recompile the PDF on every save
      vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = "*.tex", 
          command = "VimtexCompile",
      })
	end,
}
