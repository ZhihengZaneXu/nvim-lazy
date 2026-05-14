return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" }, -- Lua formatter
					python = { "black" }, -- Python formatter
					javascript = { "prettier" }, -- JavaScript formatter
					typescript = { "prettier" }, -- TypeScript formatter
					tex = { "latexindent" }, -- LaTeX formatter
				},
				format_on_save = {
					timeout_ms = 500, -- Set timeout for format-on-save
				},
			})

			-- Optional: Key mapping for manual formatting
			vim.keymap.set("n", "<leader>f", function()
				require("conform").format()
			end, { noremap = true, silent = true })
		end,
	},
}
