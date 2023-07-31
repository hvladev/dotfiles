-- Shorter function name to define mappings
local keymap = vim.keymap.set

-- Escaping
keymap("i", "jk", "<Esc>", { desc = "Go to Normal Mode using [j][k]" })
keymap("c", "jk", "<C-c>", { desc = "Go to Normal Mode using [j][k]" })
