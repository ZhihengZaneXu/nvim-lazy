-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Set memeory capacity
vim.o.maxmempattern = 200000

-- Install lazy.nvim
require("config.lazy")

require("config.keymaps")
require("config.options")
require("config.colorscheme")
