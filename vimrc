execute pathogen#infect()
filetype plugin on
filetype indent on
set ruler
set wrap
set cmdheight=1
set ignorecase
set smartcase
set lazyredraw
set magic
set showmatch
set foldcolumn=0
set autoread

syntax enable
set encoding=utf8
set ffs=unix,dos,mac
set nobackup
set nowb
set noswapfile

" spaces insted of tab
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set lbr
set ai
set si

set number
set laststatus=2
set termguicolors
colorscheme quantum

autocmd FileType java setlocal omnifunc=javacomplete#Complete
" NERDTree
map <C-n> :NERDTreeToggle<CR>
" changing buffers
map <C-J> :wincmd j<CR>
map <C-K> :wincmd k<CR>
map <C-L> :wincmd l<CR>
map <C-H> :wincmd h<CR>

" moving lines
nnoremap <down> :m .+1<CR>==
nnoremap <up> :m .-2<CR>==
inoremap <down> <Esc>:m .+1<CR>==gi
inoremap <up> <Esc>:m .-2<CR>==gi
vnoremap <down> :m '>+1<CR>gv=gv
vnoremap <up> :m '<-2<CR>gv=gv

" hide ycm [Preview] Window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:airline_powerline_fonts = 1
let g:airline_theme='quantum'

let g:ycm_global_ycm_extra_conf = '~/.ycm_compile.py'
let g:ycm_confirm_extra_conf = 0

set guifont=Ttyp0\ 11

