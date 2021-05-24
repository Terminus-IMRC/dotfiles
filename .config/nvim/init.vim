call plug#begin()
  Plug 'editorconfig/editorconfig-vim'
  Plug 'simeji/winresizer'
  Plug 'airblade/vim-gitgutter'
  Plug 'rhysd/vim-clang-format'
  Plug 'tell-k/vim-autopep8'
call plug#end()

set number
set textwidth=80
set colorcolumn=+1
set formatoptions-=t

colorscheme desert

nnoremap <Leader> <Cmd>nohlsearch<CR>

cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

set switchbuf=useopen,vsplit
nnoremap <Leader>p <Cmd>cprevious<CR>
nnoremap <Leader>n <Cmd>cnext<CR>

let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1
let g:winresizer_start_key = '<C-W><C-W>'

augroup HighlightCursor
  autocmd!
  autocmd WinLeave * set nocursorline nocursorcolumn
  autocmd WinEnter,VimEnter * set cursorline cursorcolumn
augroup END

nnoremap <M-h> <Cmd>wincmd h<CR>
nnoremap <M-j> <Cmd>wincmd j<CR>
nnoremap <M-k> <Cmd>wincmd k<CR>
nnoremap <M-l> <Cmd>wincmd l<CR>

nnoremap <M-S-h> gT
nnoremap <M-S-l> gt

autocmd TermOpen * setlocal nonumber
autocmd TermOpen * startinsert
autocmd BufEnter term://* startinsert
tnoremap <Esc> <C-\><C-n>

tnoremap <M-h> <Cmd>wincmd h<CR>
tnoremap <M-j> <Cmd>wincmd j<CR>
tnoremap <M-k> <Cmd>wincmd k<CR>
tnoremap <M-l> <Cmd>wincmd l<CR>

tnoremap <M-S-h> <Cmd>tabp<CR>
tnoremap <M-S-l> <Cmd>tabn<CR>
