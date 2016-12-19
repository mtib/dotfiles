#!/bin/bash
ai() {
    cd $HOME/github
    git clone https://aur.archlinux.org/$1.git
    cd $1
    makepkg -sri
    cd $HOME/github
    rm -rf $1
}
cd $HOME/github
git clone https://github.com/chriskempson/base16-shell.git
ai discord-canary
ai font-awesome
ai ttf-font-awesome
ai otf-font-awesome
ai vertex-themes-git
ai arc-faenza-icon-theme
ai ttf-mononoki-git
ai otf-fira-code
ai atom-editor-bin
ai i3-vim-syntax-git
ai i3lock-fancy-git
ai py3status
ai numix-icon-theme-git
ai numix-circle-icon-theme-git
ai zsh-theme-powerlevel9k
ai zsh-syntax-highlighting-git
