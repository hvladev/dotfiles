-- Fix indentation issue when entering "." before "end"
--
-- https://github.com/nvim-treesitter/nvim-treesitter/issues/3363
-- https://github.com/tree-sitter/tree-sitter-ruby/issues/230
vim.opt_local.indentkeys:remove({ "." })
