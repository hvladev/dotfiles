local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
})

vim.cmd([[
  function! s:RemoveTrailingWhitespace()
    if &filetype == 'markdown'
      return
    endif

    %s/\s\+$//e
  endfunction

  augroup misc
    autocmd!

    autocmd BufWritePre * call <SID>RemoveTrailingWhitespace()
    autocmd FileType gitcommit :set spell spelllang=en_us
    autocmd FileType markdown :setlocal textwidth=80
  augroup END
]])
