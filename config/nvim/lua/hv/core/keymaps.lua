-- Common options
local opts = { silent = true }
local term_opts = { silent = true }

-- Shorter function name to define mappings
local keymap = vim.keymap.set

-- Set leader
keymap({ "n", "v" }, "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes:
-- (String value | Help page | Affected modes | Vimscript equivalent)
-- ""     mapmode-nvo    Normal, Visual, Select, Operator-pending    :map
-- "n"    mapmode-n      Normal                                      :nmap
-- "v"    mapmode-v      Visual and Select                           :vmap
-- "s"    mapmode-s      Select                                      :smap
-- "x"    mapmode-x      Visual                                      :xmap
-- "o"    mapmode-o      Operator-pending                            :omap
-- "!"    mapmode-ic     Insert and Command-line                     :map!
-- "i"    mapmode-i      Insert                                      :imap
-- "l"    mapmode-l      Insert, Command-line, Lang-Arg              :lmap
-- "c"    mapmode-c      Command-line                                :cmap
-- "t"    mapmode-t      Terminal                                    :tmap

-- Escaping
-- keymap("i", "jk", "<Esc>", opts)
-- keymap("c", "jk", "<C-c>", opts)
keymap('i', 'jk', '<Esc>', { desc = 'Go to Normal Mode using [j][k]' })
keymap('c', 'jk', '<C-c>', { desc = 'Go to Normal Mode using [j][k]' })

-- Quit window
keymap("n", "<leader>q", "<cmd>quit<cr>", opts)

-- Suspend editor
keymap("n", "<leader>m", "<C-z>", opts)

-- Save file
keymap("n", "<leader>w", "<cmd>update<cr>", opts)

-- Clear search highlights
keymap("n", "<backspace>", "<cmd>nohlsearch<cr>", opts)

-- Switch to alternate buffer
keymap("n", "<leader><tab>", "<C-^>", opts)

-- Use j and k to navigate between wrapped lines too
keymap("v", "j", "gj", opts)
keymap("v", "k", "gk", opts)
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

-- Easier way to reach beginning/end of line
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)
keymap("x", "H", "^", opts)
keymap("x", "L", "$", opts)

-- Make Y behave like other capitals
keymap("n", "Y", "y$", opts)

-- Moving lines
keymap("x", "<C-j>", ":move'>+<CR>gv", opts)
keymap("x", "<C-k>", ":move-2<CR>gv", opts)
keymap("x", "<C-h>", "<gv", opts)
keymap("x", "<C-l>", ">gv", opts)

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

-- Diagnostic keymaps
keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
keymap('n', '<leader>dm', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
keymap('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
