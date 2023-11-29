return {
  'stevearc/oil.nvim',
  opts = {
    keymaps = {
      ["<C-v>"] = "actions.select_vsplit",
      ["<C-x>"] = "actions.select_split",
      ["<C-r>"] = "actions.refresh",
      ["<C-h>"] = false,
      ["<C-j>"] = false,
      ["<C-k>"] = false,
      ["<C-l>"] = false,
    }
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
