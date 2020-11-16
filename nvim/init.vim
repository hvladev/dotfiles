" vim:foldmethod=marker:foldlevel=0

" Misc {{{ ===================================================================

packadd! matchit

filetype plugin indent on

set autoread
set clipboard+=unnamedplus
set undofile
set undolevels=3000
set undoreload=10000


" }}} ========================================================================
" Colors & UI {{{ ============================================================

if !exists("g:syntax_on")
  syntax enable
endif

set cursorline
set linebreak
set mouse=a
set number
set scrolloff=5
set splitbelow
set splitright
set termguicolors

" }}} ========================================================================
" Searching {{{ ==============================================================

set ignorecase
set smartcase

" }}} ========================================================================
" Formatting {{{ =============================================================

set expandtab
set shiftwidth=2
set tabstop=2

" }}} ========================================================================
" Functions {{{ ==============================================================

function! s:HighlightGroupUnderCursor()
  if !exists("*synstack")
    return
  endif

  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function! s:OpenHelpInNewTab()
  if &buftype == 'help'
    if winnr('$') > 1
      wincmd T
    endif

    nnoremap <buffer> q :q<cr>
  endif
endfunction

function! s:RubyTestFile(filename)
  execute 'tabnew | terminal ++curwin /usr/local/bin/ruby-test ' . a:filename

  nnoremap <buffer> q :q<cr>
endfunction

function! s:RubyTestUnderCursor(filename, line_number)
  call <SID>RubyTestFile(a:filename . ':' . a:line_number)
endfunction

" }}} ========================================================================
" Mappings {{{ ===============================================================

let mapleader      = "\<Space>"
let maplocalleader = "\<Space>"

" Use some Emacs bindings in Insert Mode
inoremap <C-a> <Home>
inoremap <C-b> <Left>
inoremap <C-e> <End>
inoremap <C-f> <Right>

" Escaping
inoremap jk <Esc>
cnoremap jk <C-c>

" Quit
nnoremap <BS> :q<CR>

" Suspend
nnoremap <leader>m <C-z>

" Saving
nnoremap <silent> <leader>s :update<CR>

" Use j and k to navigate between wrapped lines too
vnoremap j gj
vnoremap k gk
nnoremap j gj
nnoremap k gk

" Easier way to reach beginning/end of line
nnoremap H ^
nnoremap L $
xnoremap H ^
xnoremap L $

" Moving lines
xnoremap <silent> <C-j> :move'>+<CR>gv
xnoremap <silent> <C-k> :move-2<CR>gv
xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv

" Go to tab by number
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<CR>

" Go to next/previous tab
nnoremap <leader>] gt
nnoremap <leader>[ gT

" Move tabs
nnoremap <leader>} :tabmove+<CR>
nnoremap <leader>{ :tabmove-<CR>

" Fast window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Switch to alternate buffer
nnoremap <Leader><TAB> <C-^>

" Splits
nnoremap <Leader>\| :vsplit<CR>
nnoremap <Leader>- :split<CR>

" Make Y behave like other capitals
nnoremap Y y$

" Clear search highlights
nnoremap <Leader>c :nohlsearch<CR>

" Open/reload vimrc
nnoremap <F1> :tabnew $MYVIMRC<CR>
nnoremap <F2> :source $MYVIMRC<CR>

" }}} ========================================================================
" Commands {{{ ===============================================================

command! HighlightGroupUnderCursor call <SID>HighlightGroupUnderCursor()

" }}} ========================================================================
" Autocommands {{{ ===========================================================

augroup misc
  autocmd!

  autocmd BufWritePre * :%s/\s\+$//e " Remove trailing whitespace on save
  autocmd BufEnter *.txt call <SID>OpenHelpInNewTab()
  autocmd FileType gitcommit :set spell spelllang=en_us
augroup END

" }}} ========================================================================
" Statusline {{{ =============================================================

let s:statusLineSeparator = ' · '

function! MyStatusLineGitInfo()
  let l:branchName = fugitive#head()

  return empty(l:branchName) ? '' : ' ᚠ '. l:branchName . s:statusLineSeparator "repeat(' ', 5)
endfunction

function! MyStatusLineFileEOL()
  let l:eol = get({'dos': 'CRLF', 'unix': 'LF', 'mac': 'CR'}, &fileformat, '')

  return empty(l:eol) ? '' : l:eol . s:statusLineSeparator
endfunction

function! MyStatusLineFileEncoding()
  return toupper(empty(&fileencoding) ? &encoding : &fileencoding) . s:statusLineSeparator
endfunction

function! MyStatusLineFiletype()
  return empty(&filetype) ? '' : &filetype . s:statusLineSeparator
endfunction

"       \ '%{MyStatusLineGitInfo()}' .
function! MyStatusLine()
  return ' %t %m%r ' .
       \ '%=%<' .
       \ '%{MyStatusLineFileEOL()}' .
       \ '%{MyStatusLineFileEncoding()}' .
       \ '%{MyStatusLineFiletype()}' .
       \ '%l:%c '
endfunction

set statusline=%!MyStatusLine()

" }}} ========================================================================
" Tabline {{{ ================================================================

function! MyTabLine()
  let s = ''
  for i in range(1, tabpagenr('$'))
    " select the highlighting
    if i == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . i . 'T'

    " the label is made by MyTabLabel()
    if i == tabpagenr()
      let s .= ' [ ' . i . ' ] %{MyTabLabel(' . i . ')}  '
    else
      let s .= ' [ ' . i . ' ] %{MyTabLabel(' . i . ')}  '
    endif
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999X✕%X '
  endif

  return s
endfunction

function! MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let label = expand('#' . buflist[winnr - 1] . ':t')

  return empty(label) ? 'Untitled' : label
endfunction

set tabline=%!MyTabLine()

" }}} ========================================================================
" Folding {{{ ================================================================

set fillchars+=fold:\ ,
set foldcolumn=2
set foldenable

function! MyFoldText()
  return substitute(foldtext(), '+-\+\|\s\+\d\+ lines: ', '', 'g')
endfunction

set foldtext=MyFoldText()

nnoremap <Leader>fj zo
nnoremap <Leader>fk zc
nnoremap <Leader>fa zR
nnoremap <Leader>fA zM

" }}} ========================================================================


" Packages {{{ ===============================================================

call plug#begin(stdpath('data') . '/plugged')

" Misc
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'janko/vim-test'
Plug 'jpalardy/vim-slime'
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-eunuch'

Plug 'sheerun/vim-polyglot'

" Themes
Plug 'hvladev/quill'
Plug 'lifepillar/vim-solarized8'

" Git & GitHub
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

" Ruby
Plug 'tpope/vim-rails'
" Plug 'vim-ruby/vim-ruby'

" JavaScript, TypeScript, jsx, tsx
" Plug 'yuezk/vim-js'
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'othree/javascript-libraries-syntax.vim'

" GraphQL
" Plug 'jparise/vim-graphql'

" HTML & CSS
" Plug 'hail2u/vim-css3-syntax'
" Plug 'othree/html5.vim'
" Plug 'slim-template/vim-slim'

call plug#end()

" }}} ========================================================================
" Fzf {{{ ====================================================================

let $FZF_DEFAULT_OPTS='--reverse'

let g:fzf_layout =
\ {
\   'window': {
\     'width': 0.9,
\     'height': 0.5,
\     'yoffset': 0.1,
\   }
\ }

let g:fzf_buffers_jump = 0

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

nnoremap <silent> <leader>j :GFiles --cached --others --exclude-standard<cr>
nnoremap <silent> <leader>J :FZF<cr>
nnoremap <silent> <leader>k :Buffers<cr>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

nnoremap <leader>/ :Rg<space>
nnoremap <leader>? :Rg<space><C-r><C-w><CR>

" }}} ========================================================================
" EasyMotion {{{ =============================================================

" Disable default mappings
let g:EasyMotion_do_mapping = 0
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

nmap <leader>; <Plug>(easymotion-bd-w)
nmap <leader>f <Plug>(easymotion-bd-f)
nmap <leader>, <Plug>(easymotion-bd-jk)

" }}} ========================================================================
" Themes {{{ =================================================================

colorscheme quill

" set background=light
" colorscheme solarized8_flat

" }}} ========================================================================
" Tests {{{ ==================================================================

" augroup ruby_test
"   autocmd!

"   autocmd FileType ruby nnoremap <buffer> <leader>l :call <SID>RubyTestFile(expand('%'))<CR>
"   autocmd FileType ruby nnoremap <buffer> <leader>L :call <SID>RubyTestUnderCursor(expand('%'), line('.'))<CR>
" augroup END

" }}} ========================================================================
" vim-test {{{ ===============================================================

let test#strategy = 'neovim'
let test#neovim#term_position = 'split'

augroup ruby_test
  autocmd!

  autocmd FileType ruby nnoremap <silent> <CR>       :w<CR>:TestNearest<CR>
  autocmd FileType ruby nnoremap <silent> <leader>tf :w<CR>:TestFile<CR>
  autocmd FileType ruby nnoremap <silent> <leader>ts :w<CR>:TestSuite<CR>
  autocmd FileType ruby nnoremap <silent> <leader>tl :w<CR>:TestLast<CR>
  autocmd FileType ruby nnoremap <silent> <leader>tv :w<CR>:TestVisit<CR>
augroup END

" }}} ========================================================================
" vim-slime {{{ ==============================================================

let g:slime_no_mappings = 1
let g:slime_dont_ask_default = 1

vmap <Leader>r <Plug>SlimeRegionSend
nmap <Leader>r <Plug>SlimeParagraphSend

let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "2"}

" }}} ========================================================================
