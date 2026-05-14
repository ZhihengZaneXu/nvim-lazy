vim.g.mapleader = " " --setting <leader>

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- keymap.set(mode, new_key, original command)
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "<leader>x", ":close<CR>") -- close current split window

-- tab map
keymap.set("n", "<leader>to", ":tabnew<CR>") --open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") --close current tab
keymap.set("n", "<leader>tn", ":+tabnext<CR>") --close current tab
keymap.set("n", "<leader>tp", ":-tabnext<CR>") --close current tab
-- tmux navigation
keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>")
keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>")
keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>")
-- nvim-tree
keymap.set("n", "<leader>t", ":NvimTreeOpen<CR>", { noremap = true, silent = true })
-- barbar
-- Move to previous/next
keymap.set("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
-- Re-order to previous/next
keymap.set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
keymap.set("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
-- Goto buffer in position...
keymap.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
keymap.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
keymap.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
keymap.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
keymap.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
keymap.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
keymap.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
keymap.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
-- Pin/unpin buffer
keymap.set("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
-- Close buffer
keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
-- Magic buffer-picking mode
keymap.set("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
-- Sort automatically by...
keymap.set("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
keymap.set("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
keymap.set("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
keymap.set("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)
-- Jupter notebook setup

-- Add cells
vim.keymap.set("n", "<leader>ja", "<cmd>JupyterAddCellBelow<CR>", { desc = "Add Jupyter cell below" })
vim.keymap.set("n", "<leader>jA", "<cmd>JupyterAddCellAbove<CR>", { desc = "Add Jupyter cell above" })

-- Cell operations
vim.keymap.set("n", "<leader>jd", "<cmd>JupyterRemoveCell<CR>", { desc = "Remove current Jupyter cell" })
vim.keymap.set("n", "<leader>jm", "<cmd>JupyterMergeCellAbove<CR>", { desc = "Merge with cell above" })
vim.keymap.set("n", "<leader>jM", "<cmd>JupyterMergeCellBelow<CR>", { desc = "Merge with cell below" })
vim.keymap.set("n", "<leader>jt", "<cmd>JupyterConvertCellType<CR>", { desc = "Convert cell type (code/markdown)" })
vim.keymap.set("v", "<leader>jm", "<cmd>JupyterMergeVisual<CR>", { desc = "Merge selected cells" })
vim.keymap.set(
	"n",
	"<leader>jD",
	"<cmd>JupyterDeleteCell<CR>",
	{ desc = "Delete cell under cursor and store in register" }
)

-- Aerial
vim.keymap.set("n", "<leader>ao", "<cmd>AerialToggle! right<cr>", { desc = "Toggle Aerial Outline" })
vim.keymap.set("n", "<leader>an", "<cmd>AerialNext<cr>", { desc = "Next symbol" })
vim.keymap.set("n", "<leader>ap", "<cmd>AerialPrev<cr>", { desc = "Previous symbol" })
