local plugins = {
  require("hv.plugins.themes"),
  require("hv.plugins.lsp"),
  require("hv.plugins.autopairs"),
  require("hv.plugins.barbecue"),
  require("hv.plugins.cmp"),
  require("hv.plugins.comment"),
  require("hv.plugins.devicons"),
  -- diffview.lua
  -- fidget.lua
  -- gitsigns.lua
  require("hv.plugins.heirline"),
  -- hlargs.lua
  -- indent.lua
  -- init.lua
  -- markdown.lua
  -- navigator.lua
  require("hv.plugins.nvimtree"),
  require("hv.plugins.signature"),
  require("hv.plugins.surround"),
  require("hv.plugins.telescope"),
  require("hv.plugins.treesitter"),
  require("hv.plugins.which_key"),
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins, {
	defaults = { lazy = false },
})
