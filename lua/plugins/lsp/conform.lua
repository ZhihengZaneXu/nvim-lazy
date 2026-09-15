return {
	{
		"stevearc/conform.nvim",
		config = function()
			-- prettierd (fast, stays running) when installed, otherwise prettier.
			local prettier = { "prettierd", "prettier", stop_after_first = true }

			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" }, -- Lua formatter
					python = { "black" }, -- Python formatter
					javascript = prettier, -- JavaScript formatter
					typescript = prettier, -- TypeScript formatter
					css = prettier,
					html = prettier,
					json = prettier,
					tex = { "latexindent" }, -- LaTeX formatter
					-- No markdown: Limesurvey_user.md has one-line HTML that must not be re-wrapped.
				},
				format_on_save = {
					timeout_ms = 2000, -- Prettier's startup alone can exceed 500 ms on large files
				},
			})

			-- Optional: Key mapping for manual formatting
			vim.keymap.set("n", "<leader>f", function()
				require("conform").format()
			end, { noremap = true, silent = true })
		end,
	},
}
