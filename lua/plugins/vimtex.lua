return {
	"lervag/vimtex",
	lazy = false,
	init = function()
		-- Use Tectonic for clean, modern compilation
		vim.g.vimtex_compiler_method = "tectonic"
		vim.g.vimtex_compiler_tectonic = {
			executable = "tectonic",
			options = {
				"--keep-logs", -- keep the .log so VimTeX can parse errors/warnings
				"--synctex",
			},
		}

		-- Zathura for preview (forward/inverse search handled by VimTeX)
		vim.g.vimtex_view_method = "zathura"

		-- Quickfix: only pop up on real errors, and never steal focus
		vim.g.vimtex_quickfix_open_on_warning = 0
		vim.g.vimtex_quickfix_mode = 2

		-- Tectonic has no continuous mode, so recompile the PDF on every save
		vim.api.nvim_create_autocmd("BufWritePost", {
			group = vim.api.nvim_create_augroup("VimtexCompileOnSave", { clear = true }),
			pattern = "*.tex",
			callback = function()
				if vim.fn.exists(":VimtexCompile") == 2 then
					vim.cmd("VimtexCompile")
				end
			end,
		})
	end,
}
