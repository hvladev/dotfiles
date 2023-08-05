-- Set leader before plugins are required.
-- Otherwise wrong leader will be used.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Common options
local opts = { silent = true }
local term_opts = { silent = true }

-- Shorter function name to define mappings
local keymap = vim.keymap.set

-- Escaping
keymap("i", "jk", "<Esc>", opts)
keymap("c", "jk", "<C-c>", opts)

-- Save file
keymap("n", "<leader>s", "<cmd>update<cr>", opts)

-- Switch to alternate buffer
keymap("n", "<leader><tab>", "<C-^>", opts)

-- Fast window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Resize window with arrows
keymap("n", "<A-Up>", ":resize +2<CR>", opts)
keymap("n", "<A-Down>", ":resize -2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- Go to tab
keymap("n", "<leader>0", "<cmd>:tablast<cr>", opts)
keymap("n", "<leader>1", "1gt", opts)
keymap("n", "<leader>2", "2gt", opts)
keymap("n", "<leader>3", "3gt", opts)
keymap("n", "<leader>4", "4gt", opts)
keymap("n", "<leader>5", "5gt", opts)
keymap("n", "<leader>6", "6gt", opts)
keymap("n", "<leader>7", "7gt", opts)
keymap("n", "<leader>8", "8gt", opts)
keymap("n", "<leader>9", "9gt", opts)

-- Go to previous/next tab
keymap("n", "<leader>]", "gt", opts)
keymap("n", "<leader>[", "gT", opts)

-- Move tab to the left/right
keymap("n", "<leader>}", "<cmd>tabmove+<cr>", opts)
keymap("n", "<leader>{", "<cmd>tabmove-<cr>", opts)
