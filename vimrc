let $NVIM_TUI_ENABLE_TRUE_COLOR=1

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
set clipboard=unnamed
set colorcolumn=80

" PYTHON SETTINGS
let g:python_host_prog = $PYENV_ROOT . '/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT . '/versions/neovim3/bin/python'

" AIRLINE SETTINGS
set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h13
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0

" CTRLP settings
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dont_split = 'NERD'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|tmp'

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

" EasyMotion bindings
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Move swapfiles
set directory=~/.vimbackup

" ULTISNIPS 
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Highlight github markdown automatically
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END
