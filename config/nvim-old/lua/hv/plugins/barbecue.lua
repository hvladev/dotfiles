return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    show_dirname = false,
    show_modified = true,
    symbols = {
      modified = "" -- ●
    },
    theme = {
      normal = { bg = "#21252b" },
      modified = { fg = "#e5c07b" },
    }
  },
}
