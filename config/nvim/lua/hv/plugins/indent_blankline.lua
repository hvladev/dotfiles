return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  config = function()
    require('ibl').setup({
      whitespace = {
        highlight = { "Whitespace", "NonText" }
      },
    })
  end
}
