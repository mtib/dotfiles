execute pathogen#infect()
filetype plugin on
filetype indent on
set ruler
set wrap
set cmdheight=2
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
colorscheme desert

autocmd FileType java setlocal omnifunc=javacomplete#Complete
map <C-n> :NERDTreeToggle<CR>
