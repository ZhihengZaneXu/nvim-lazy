return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim", -- Integrates Mason with nvim-lspconfig
			"neovim/nvim-lspconfig", -- Neovim LSP configuration
		},
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✔",
						package_pending = "➜",
						package_uninstalled = "✘",
					},
				},
			})

			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" }, -- Add your desired LSP servers
				automatic_installation = true, -- Auto-install configured LSPs
			})
		end,
	},
}
