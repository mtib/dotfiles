" file: .vimrc
" author: mtib
"
" default vimrc to be used with neovim

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf

call vundle#begin()
" Update Vundle with Vundle
Plugin 'VundleVim/Vundle.vim'
Plugin 'xolox/vim-misc'

" Visual(-only) Plugins
Plugin 'chriskempson/base16-vim'
Plugin 'dikiaap/minimalist'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'felixhummel/setcolors.vim'
Plugin 'rakr/vim-one'
Plugin 'morhetz/gruvbox'

" File Openers
Plugin 'scrooloose/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'ctrlpvim/ctrlp.vim'

" Auto Complete
"Plugin 'scrooloose/syntastic'
Plugin 'valloric/youcompleteme'
Plugin 'w0rp/ale'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'jiangmiao/auto-pairs'

" Language Support
" Plugin 'leafgarland/typescript-vim'
Plugin 'mattn/emmet-vim'
" Plugin 'klen/python-mode'
Plugin 'fatih/vim-go'
Plugin 'Shougo/vimproc.vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'alx741/ghc.vim'
" Plugin 'c.vim'
" Plugin 'pangloss/vim-javascript'

" tpope
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat.git'
Plugin 'tpope/vim-surround'

" Web Integration
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

" Aligner
Plugin 'junegunn/vim-easy-align'
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
set mouse=a
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

" colorscheme
" execute 'set background='.((strftime("%H")%20) > 8 ? 'light' : 'dark')
if (empty($TMUX))
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum
    set background=dark
    colorscheme gruvbox
    let g:airline_theme='one'
    if (has("termguicolors"))
        set termguicolors
    endif
else
    colorscheme deepsea
    let g:airline_theme='minimalist'
endif


set wildignore+=*.so,*.o,*.swp,*.zip,*.class,.node*
" let g:ctrlp_user_command = 'find %s -type f'

au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

" Start interactive EasyAlign in visual mode (e.g. vipga)
" xnoremap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nnoremap ga <Plug>(EasyAlign)

nnoremap ;; :normal! mqA;<esc>`q

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

augroup ft_golang
    autocmd!
augroup end

augroup ft_java
    autocmd!
    let g:syntastic_java_checkers=['javac', 'checkstyle']
    " let g:syntastic_java_checkstyle_classpath="$HOME/bin/checkstyle-java/checkstyle-7.6.1-tubs.jar"
    let g:syntastic_java_checkstyle_conf_file="$HOME/bin/checkstyle-java/tubs_checks.xml"
    autocmd FileType java call SetJavaKeymap()
    function! SetJavaKeymap()
        nnoremap <F1> :!jcheck %<CR>
        nnoremap <F2> :!javac % && java %:r<CR>
    endfunction
augroup END

augroup ft_c
    autocmd!
    autocmd FileType c call SetCKeymap()
    function! SetCKeymap()
        nnoremap <F1> :w<CR>:!clear;echo "=== MAKING % ===";make<CR>
        nnoremap <silent> <F2> :w<CR>:!clear;echo "=== COMPILING % ===";clang -Wall -o %< % && echo "===   RUNNING %<   ===" && ./%<<CR>
    endfunction
augroup end

autocmd FileType java setlocal omnifunc=javacomplete#Complete
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
nnoremap t :%s/\s\{1,}$//gc<CR>
nnoremap <space> i<space><Esc>ea<space><Esc>

" Syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_quiet_messages = { "type": "style" }

" ALE
let g:ale_completion_enabled = 1


" make vim-go and syntastic like each other
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }


let g:syntastic_javascript_checkers = []

let $CLASSPATH="./Lib.jar:."

" moving lines
nnoremap <down> :m .+1<CR>==
nnoremap <up> :m .-2<CR>==
inoremap <down> <Esc>:m .+1<CR>==gi
inoremap <up> <Esc>:m .-2<CR>==gi
vnoremap <down> :m '>+1<CR>gv=gv
vnoremap <up> :m '<-2<CR>gv=gv

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" easy search
nnoremap <F4> :execute "vimgrep /" . expand("<cword>") . "/gj **" <Bar> cw<cr>
" vnoremap <F4> :execute "vimgrep /" . expand("

" paste from clipboard
inoremap <c-p> <Esc>"+p
vnoremap <c-v> "+y

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
" let g:airline_theme='minimalist'

let g:ycm_global_ycm_extra_conf = '~/.ycm_compile.py'
let g:syntastic_python_checkers = []
" let g:pymode_python = 'python3'
" let g:pymode_lint_checkers = []
" let g:pymode_warnings = 0
" let g:pymode_folding = 0
let g:ycm_confirm_extra_conf = 0

" set guifont=mononoki\ 12
"hi Normal guibg=NONE ctermbg=NONE

set guioptions=aegimL


" experimental iabbrevs
iabbrev @@ markus@tibyte.net
iabbrev taht that
iabbrev widht width
iabbrev heigth height
iabbrev sysout System.out.print
