filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'chriskempson/base16-vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'

Plugin 'scrooloose/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim'

Plugin 'scrooloose/syntastic'
Plugin 'valloric/youcompleteme'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'mattn/emmet-vim'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'klen/python-mode'
Plugin 'fatih/vim-go'
Plugin 'Shougo/vimproc.vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'alx741/ghc.vim'

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

set relativenumber
set laststatus=2
set termguicolors
colorscheme $VIMBG

" HASKELL
augroup ft_haskell
    autocmd!
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
    autocmd FileType haskell compiler ghc
    let g:ycm_semantic_triggers = {'haskell' : ['.']}
    autocmd FileType haskell call SetHaskellKeymap()
augroup END

function SetHaskellKeymap()
    inoreab <buffer> int Int
    inoreab <buffer> integer Integer
    inoreab <buffer> string String
    inoreab <buffer> double Double
    inoreab <buffer> float Float
    inoreab <buffer> true True
    inoreab <buffer> false False
    inoreab <buffer> maybe Maybe
    inoreab <buffer> just Just
    inoreab <buffer> nothing Nothing
    inoreab <buffer> io IO ()
endfunction

" JAVA
autocmd FileType java setlocal omnifunc=javacomplete#Complete
" NERDTree
noremap <C-n> :NERDTreeToggle<CR>
" changing buffers
" nnoremap <C-j> :wincmd j<CR>
" nnoremap <C-k> :wincmd k<CR>
" nnoremap <C-h> :wincmd h<CR>
" nnoremap <C-l> :wincmd l<CR>
nnoremap t /\s\{1,}$<CR>
" noremap q <NOP>

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
let g:airline_theme='zenburn'

let g:ycm_global_ycm_extra_conf = '~/.ycm_compile.py'
let g:ycm_confirm_extra_conf = 0

set guifont=mononoki\ 12

" experimental iabbrevs
iabbrev taht that
iabbrev widht width
iabbrev heigth height
