filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'

Plugin 'scrooloose/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'

Plugin 'scrooloose/syntastic'
Plugin 'valloric/youcompleteme'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'mattn/emmet-vim'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'klen/python-mode'
Plugin 'fatih/vim-go'

Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat.git'
Plugin 'tpope/vim-surround'

Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
call vundle#end()

filetype plugin on
filetype indent on
set ruler
set wrap
set cmdheight=1
set ignorecase
set smartcase
set lazyredraw
set ttyfast
set magic
set showmatch
set foldcolumn=0
set autoread
set showcmd

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
set relativenumber
set laststatus=2
set termguicolors
colorscheme $VIMBG

autocmd FileType java setlocal omnifunc=javacomplete#Complete
" NERDTree
noremap <C-n> :NERDTreeToggle<CR>
" changing buffers
noremap <C-J> :wincmd j<CR>
noremap <C-K> :wincmd k<CR>
noremap <C-L> :wincmd l<CR>
noremap <C-H> :wincmd h<CR>
"nnoremap q <NOP>

" Syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" Java Setup
let g:syntastic_java_checkers=['javac', 'checkstyle']
let g:syntastic_java_checkstyle_classpath="~/bin/checkstyle-java/checkstyle-7.2-all.jar"
let g:syntastic_java_checkstyle_conf_file="~/bin/checkstyle-java/checkstyle-7.2.xml"
autocmd FileType java call SetJavaKeymap()
function SetJavaKeymap()
    nnoremap <F1> :te jcheck % \| less<CR>
    nnoremap <F2> :te javac % && java %:r<CR>
endfunction

" make vim-go and syntastic like each other
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" moving lines
nnoremap <down> :m .+1<CR>==
nnoremap <up> :m .-2<CR>==
inoremap <down> <Esc>:m .+1<CR>==gi
inoremap <up> <Esc>:m .-2<CR>==gi
vnoremap <down> :m '>+1<CR>gv=gv
vnoremap <up> :m '<-2<CR>gv=gv

" easy save
nnoremap ,, :w<CR>
nnoremap // :nohlsearch<CR>

" hide ycm [Preview] Window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:airline_powerline_fonts = 1
let g:airline_theme='base16'

let g:ycm_global_ycm_extra_conf = '~/.ycm_compile.py'
let g:ycm_confirm_extra_conf = 0

set guifont=mononoki\ 12

" experimental iabbrevs
iabbrev taht that
iabbrev widht width
iabbrev heigth height
