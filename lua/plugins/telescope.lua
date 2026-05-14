return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	-- or                              , branch = '0.1.x',
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		telescope.setup({}) -- You can add Telescope-specific settings here if needed
		-- Define key mappings
		local keymap = vim.keymap.set
		keymap("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
		keymap("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
		keymap("n", "<leader>fb", builtin.buffers, { desc = "List Buffers" })
		keymap("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
	end,
}
