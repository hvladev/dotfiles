return {
  {
    "Olical/conjure",
    config = function()
      vim.api.nvim_create_autocmd("BufNewFile", {
        pattern = "conjure-log-*",
        callback = function()
          vim.diagnostic.disable(0)
        end,
        group = vim.api.nvim_create_augroup("ConjureLog", { clear = true }),
      })
    end
  },

  {
    "guns/vim-sexp",
    dependencies = {
      "tpope/vim-sexp-mappings-for-regular-people",
    },
  },
}
