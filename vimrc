execute pathogen#infect()
syntax on
filetype plugin indent on

" BASE SETTINGS
colorscheme railscasts
set number
set cursorline
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set ignorecase
set smartcase
set smartindent
set autoindent
set laststatus=2
set shell=/bin/bash

" AIRLINE SETTINGS
set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h13
let g:airline_powerline_fonts = 1

" CTRLP settings
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dont_split = 'NERD'

" COMMANDS
command Sws StripWhitespace

" KEY BINDINGS

" Inserts newline with Enter key
" Inserts newline after with Shift-Enter
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Open NERDTree
map <C-n> :NERDTreeToggle<CR>

" Open CtrlP
nmap <C-p> :CtrlPRoot<CR>

" Move swapfiles
set directory=~/.vimbackup

" Highlight github markdown automatically
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END
