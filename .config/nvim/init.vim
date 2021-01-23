call plug#begin()
  Plug 'editorconfig/editorconfig-vim'
  Plug 'simeji/winresizer'
  Plug 'airblade/vim-gitgutter'
  Plug 'rhysd/vim-clang-format'
call plug#end()

set number
set textwidth=80
set colorcolumn=+1

colorscheme desert

let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1

augroup HighlightCursor
  autocmd!
  autocmd WinLeave * set nocursorline nocursorcolumn
  autocmd WinEnter,VimEnter * set cursorline cursorcolumn
augroup END
