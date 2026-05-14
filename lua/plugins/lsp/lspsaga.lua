return {

	{
		"nvimdev/lspsaga.nvim",
		dependencies = { "nvim-lspconfig" },
		config = function()
			require("lspsaga").setup({})
		end,
	},
}
