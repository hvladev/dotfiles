require('hv.core.keymaps')
require('hv.core.options')
require('hv.core.autocommands')

require('hv.plugins.lazy').setup({
  require('hv.plugins.onedark'),
  require('hv.plugins.telescope'),
  require('hv.plugins.treesitter'),
  require('hv.plugins.lsp'),
  require('hv.plugins.autocompletion'),
  require('hv.plugins.indent_blankline'),
  require('hv.plugins.oil'),

  'github/copilot.vim',
  'tpope/vim-eunuch',
  'tpope/vim-rails',
  'tpope/vim-sleuth',
  'nvim-tree/nvim-web-devicons',
  { 'numToStr/Comment.nvim',  opts = {} },
  { 'kylechui/nvim-surround', version = '*', opts = {} },
})
