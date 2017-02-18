" author: mtib
" file: .vimrc
"
" default vimrc to be used with neovim

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Update Vundle with Vundle
Plugin 'VundleVim/Vundle.vim'
Plugin 'xolox/vim-misc'

" Visual(-only) Plugins
" Plugin 'chriskempson/base16-vim'
Plugin 'dikiaap/minimalist'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'felixhummel/setcolors.vim'

" File Openers
Plugin 'scrooloose/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'ctrlpvim/ctrlp.vim'

" Auto Complete
Plugin 'scrooloose/syntastic'
Plugin 'valloric/youcompleteme'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'shawncplus/phpcomplete.vim'

" Language Support
Plugin 'mattn/emmet-vim'
" Plugin 'klen/python-mode'
Plugin 'fatih/vim-go'
Plugin 'Shougo/vimproc.vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'alx741/ghc.vim'

" tpope
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat.git'
Plugin 'tpope/vim-surround'

" Web Integration
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
call vundle#end()

filetype plugin on
filetype indent on
let mapleader=","
set ruler
set wrap
set cmdheight=1
set ignorecase
set smartcase
set lazyredraw
set ttyfast
set magic
set showmatch " nohlsearch is bound to //
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

" linebreak
set lbr
" indentation:
set ai
set si

set relativenumber
set laststatus=2
" set termguicolors
colorscheme $VIMBG

set wildignore+=*.so,*.o,*.swp,*.zip,*.class,.node*
" let g:ctrlp_user_command = 'find %s -type f'

" HASKELL
augroup ft_haskell
    autocmd!
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
    autocmd FileType haskell compiler ghc
    let g:ycm_semantic_triggers = {'haskell' : ['.']}
    autocmd FileType haskell call SetHaskellKeymap()
    function! SetHaskellKeymap()
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
augroup END


" JAVA
augroup ft_java
    autocmd!
    autocmd FileType java setlocal omnifunc=javacomplete#Complete
    let g:syntastic_java_checkers=['javac', 'checkstyle']
    let g:syntastic_java_checkstyle_classpath="~/bin/checkstyle-java/checkstyle-7.2-all.jar"
    let g:syntastic_java_checkstyle_conf_file="~/bin/checkstyle-java/checkstyle-7.2.xml"
    autocmd FileType java call SetJavaKeymap()
    function! SetJavaKeymap()
        nnoremap <F1> :te jcheck % \| less<CR>
        nnoremap <F2> :te javac % && java %:r<CR>
    endfunction
augroup END

augroup ft_arduino
    autocmd!
    autocmd BufNewFile,BufRead *.ino call SetArduinoKeymap()
    function! SetArduinoKeymap()
        nnoremap ,u :!make upload<CR>
        " nnoremap ,m :!bash -c "make monitor"<CR>
    endfunction
augroup END

" NERDTree
noremap <C-n> :NERDTreeToggle<CR>

" show trailing whitespace
nnoremap t /\s\{1,}$<CR>

" Syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0


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

" easy search
nnoremap <F4> :execute "vimgrep /" . expand("<cword>") . "/gj **" <Bar> cw<cr>
" vnoremap <F4> :execute "vimgrep /" . expand("

" paste from clipboard
inoremap <c-p> <Esc>"+p

" emmet me this:
inoremap <c-e> <Esc>:Emmet<space>

" easy save
nnoremap ,, :w<CR>
nnoremap // :nohlsearch<CR>

" hide ycm [Preview] Window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <c-f> :CtrlPBuffer<cr>

let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist'

let g:ycm_global_ycm_extra_conf = '~/.ycm_compile.py'
let g:syntastic_python_checkers = []
" let g:pymode_python = 'python3'
" let g:pymode_lint_checkers = []
" let g:pymode_warnings = 0
" let g:pymode_folding = 0
let g:ycm_confirm_extra_conf = 0

set guifont=mononoki\ 12

" experimental iabbrevs
iabbrev taht that
iabbrev widht width
iabbrev heigth height
