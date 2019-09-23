set nocompatible
set modeline
set ai
set nu
set colorcolumn=81
set lazyredraw
set nottyfast
set wildmode=longest,full

colorscheme elflord
autocmd BufRead,BufNewFile *.ino set filetype=cpp
syntax on

let skip_defaults_vim = 1
let GtagsCscope_Auto_Load = 1
let GtagsCscope_Auto_Map = 1
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1
let g:winresizer_start_key = '<C-W><C-W>'

if !isdirectory('~/.vim/bundle/')
  call system('git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim')
  let vundle_newly_installed = 1
endif

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'editorconfig/editorconfig-vim'
  Plugin 'simeji/winresizer'
  Plugin 'airblade/vim-gitgutter'
call vundle#end()
filetype plugin indent on

"if vundle_newly_installed
"  echo 'Installing plugins...'
"  PluginInstall
"  redraw!
"endif

noremap <C-x> <nop>
noremap <C-a> <nop>

augroup CursorLineColumnOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
  autocmd WinLeave * setlocal nocursorline nocursorcolumn
augroup END

command! -nargs=+ Man !man <args>
