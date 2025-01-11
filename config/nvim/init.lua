require("hv.core.keymaps")
require("hv.core.options")
require("hv.core.autocommands")

if vim.g.neovide then
  require("hv.neovide")
end

require("hv.plugins.lazy").setup({
  require("hv.plugins.onedark"),
  require("hv.plugins.telescope"),
  require("hv.plugins.treesitter"),
  require("hv.plugins.lsp"),
  require("hv.plugins.copilot"),
  require("hv.plugins.autocompletion"),
  require("hv.plugins.indent_blankline"),
  require("hv.plugins.oil"),
  require("hv.plugins.formatter"),
  require("hv.plugins.clojure"),

  "tpope/vim-eunuch",
  "tpope/vim-rails",
  "tpope/vim-sleuth",
  "nvim-tree/nvim-web-devicons",
  { "numToStr/Comment.nvim", opts = {} },
  { "kylechui/nvim-surround", version = "*", opts = {} },

  -- In testing phase

  "vim-test/vim-test",
  -- https://github.com/rgroli/other.nvim
})
