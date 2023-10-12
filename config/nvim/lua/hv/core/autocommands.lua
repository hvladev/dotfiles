local autocmd = vim.api.nvim_create_autocmd
local hv_group = vim.api.nvim_create_augroup('hv_misc', { clear = true })

autocmd('TextYankPost', {
  group = hv_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank()
  end,
})

autocmd('BufWritePre', {
  group = hv_group,
  pattern = '*',
  callback = function()
    if vim.bo.filetype == 'markdown' then
      return
    end

    vim.cmd([[%s/\s\+$//e]])
  end,
})

autocmd('FileType', {
  group = hv_group,
  pattern = 'gitcommit',
  command = 'set spell spelllang=en_us',
})

autocmd('FileType', {
  group = hv_group,
  pattern = 'markdown',
  command = 'setlocal textwidth=80',
})
