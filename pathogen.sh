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
git clone https://github.com/tyrannicaltoucan/vim-quantum
git clone https://github.com/tpope/vim-surround
git clone git://github.com/FredKSchott/CoVim.git
git clone https://github.com/klen/python-mode.git
vim -u NONE -c "helptags vim-fugitive/doc" -c q

aur() {
    git clone https://aur.archlinux.org/$1.git
    cd $1
    makepkg -sri
    cd ..
}

(
    cd ..
    aur "uw-ttyp0-font"
    aur "bdf-creep"
)
