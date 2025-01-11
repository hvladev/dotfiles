return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require("oil").setup({
      keymaps = {
        ['<C-v>'] = 'actions.select_vsplit',
        ['<C-x>'] = 'actions.select_split',
        ['<C-r>'] = 'actions.refresh',
        ['<C-h>'] = false,
        ['<C-j>'] = false,
        ['<C-k>'] = false,
        ['<C-l>'] = false,
      }
    })

    local map = vim.keymap.set
    map('n', '<leader>e', ':Oil --float<cr>', {
      desc = '[e] Open file explorer (current file)'
    })
    map('n', '<leader>E', ':Oil --float .<cr>', {
      desc = '[E] Open file explorer (root)'
    })
  end,
}
