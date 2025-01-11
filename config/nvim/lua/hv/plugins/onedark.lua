-- https://github.com/navarasu/onedark.nvim

return {
  'navarasu/onedark.nvim',
  lazy = false, -- load during startup as it is the main colorscheme
  priority = 1000, -- load before all the other start plugins
  config = function()
    local onedark = require('onedark')

    onedark.setup({
      -- toggle theme style
      toggle_style_key = '<leader>ts',
      toggle_style_list = { 'dark', 'light' },
      -- Custom colors & highlight groups
      colors = {},
      highlights = {
        VertSplit = { fg = '$black', bg = '$black' },
        StatusLine = { fg = '$fg', bg = '$black' },
        StatusLineNC = { fg = '$grey', bg = '$black' },
      },
    })

    onedark.load()
  end,
}
