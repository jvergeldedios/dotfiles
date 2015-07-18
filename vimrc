execute pathogen#infect()
syntax on
filetype plugin indent on

" MY STUFF

set number
set cursorline
colorscheme railscasts 
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set ignorecase
set smartcase
set smartindent
set autoindent

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
