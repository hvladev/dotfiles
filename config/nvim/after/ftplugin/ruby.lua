vim.keymap.set('n', '<CR>', ':TestNearest<CR>', {
  desc = '[T]est [N]earest',
  buffer = true
})
vim.keymap.set('n', '<leader>tf', ':TestFile<CR>', {
  desc = '[T]est [F]ile',
  buffer = true
})
vim.keymap.set('n', '<leader>ts', ':TestSuite<CR>', {
  desc = '[T]est [S]uite',
  buffer = true
})
vim.keymap.set('n', '<leader>tl', ':TestLast<CR>', {
  desc = '[T]est [L]ast',
  buffer = true
})
vim.keymap.set('n', '<leader>tv', ':TestVisit<CR>', {
  desc = '[T]est [V]isit',
  buffer = true
})
