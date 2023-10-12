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

  'tpope/vim-sleuth',
  { 'numToStr/Comment.nvim', opts = {} },

  -- Plugins to explore:
  -- https://github.com/stevearc/oil.nvim
})
