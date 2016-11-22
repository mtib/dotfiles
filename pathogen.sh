#!/bin/bash
mkdir -p ~/.vim/bundle || :
cd ~/.vim/bundle

git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/shawncplus/phpcomplete.vim
git clone https://github.com/xuyuanp/nerdtree-git-plugin
git clone https://github.com/scrooloose/syntastic
git clone https://github.com/artur-shaik/vim-javacomplete2
git clone https://github.com/airblade/vim-gitgutter
git clone https://github.com/valloric/youcompleteme
git clone https://github.com/vim-airline/vim-airline
git clone git://github.com/tpope/vim-fugitive.git
git clone git://github.com/vim-airline/vim-airline-themes
# git clone https://github.com/tyrannicaltoucan/vim-quantum
git clone https://github.com/tpope/vim-surround
# git clone git://github.com/FredKSchott/CoVim.git
git clone https://github.com/klen/python-mode.git
git clone git://github.com/tpope/vim-repeat.git
git clone git://github.com/tpope/vim-commentary.git
git clone https://github.com/chriskempson/base16-vim.git
git clone https://github.com/mattn/emmet-vim.git
vim -u NONE -c "helptags vim-fugitive/doc" -c q

