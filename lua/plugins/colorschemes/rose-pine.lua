return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		lazy = false,
		config = function()
			require("rose-pine").setup({
				variant = "moon",
				dark_variant = "moon",
				styles = {
					bold = true,
					italic = true,
					transparency = false,
				},
			})

			vim.cmd.colorscheme("rose-pine")

			vim.api.nvim_create_user_command("RosePineMoon", function()
				require("rose-pine").setup({
					variant = "moon",
					dark_variant = "moon",
					styles = {
						bold = true,
						italic = true,
						transparency = false,
					},
				})
				vim.cmd.colorscheme("rose-pine")
			end, {})

			vim.api.nvim_create_user_command("RosePineDawn", function()
				require("rose-pine").setup({
					variant = "dawn",
					dark_variant = "moon",
					styles = {
						bold = true,
						italic = true,
						transparency = false,
					},
				})
				vim.cmd.colorscheme("rose-pine")
			end, {})
		end,
	},
}
