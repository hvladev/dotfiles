require('hv.core.keymaps')
require('hv.core.options')
require('hv.core.autocommands')

require('hv.plugins.lazy').setup({
  require('hv.plugins.onedark'),
  require('hv.plugins.telescope'),
  require('hv.plugins.treesitter'),
  require('hv.plugins.lsp'),
  require('hv.plugins.copilot'),
  require('hv.plugins.autocompletion'),
  require('hv.plugins.indent_blankline'),
  require('hv.plugins.oil'),
  require('hv.plugins.formatter'),

  'tpope/vim-eunuch',
  'tpope/vim-rails',
  'tpope/vim-sleuth',
  'nvim-tree/nvim-web-devicons',
  { 'numToStr/Comment.nvim',  opts = {} },
  { 'kylechui/nvim-surround', version = '*', opts = {} },

  -- TODO: testing
  {
    'vim-test/vim-test',
    config = function()
      vim.keymap.set('n', '<CR>', ':TestNearest<CR>', { desc = '[T]est [N]earest' })
      vim.keymap.set('n', '<leader>tf', ':TestFile<CR>', { desc = '[T]est [F]ile' })
      vim.keymap.set('n', '<leader>tl', ':TestLast<CR>', { desc = '[T]est [L]ast' })
    end
  }

  -- TODO: check this out
  -- https://github.com/rgroli/other.nvim
})
