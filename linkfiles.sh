#!/bin/bash

l() {
	ln -s $(pwd)/$1 $2
}

l vimrc $HOME/.vimrc
l svimrc $HOME/.svimrc
l xinitrc $HOME/.xinitrc
l xprofile $HOME/.xprofile
l zprofile $HOME/.zprofile
l feh_update.sh $HOME/.feh_update.sh
l feh_constants.sh $HOME/.feh_constants.sh
l gitignore $HOME/.gitignore
mkdir -p $HOME/.config/i3{,status}
l i3/i3 $HOME/.config/i3/config
l i3/i3status $HOME/.config/i3status/config
l zshrc.local $HOME/.zshrc.local
mkdir -p $HOME/.vifm
l vifmrc $HOME/.vifm/vifmrc
l tmux.conf $HOME/.tmux.conf
mkdir -p $HOME/.config/ranger
l rangerrc $HOME/.config/ranger/rc.conf
# link nvim config to vim
ln -s $HOME/.vim $HOME/.config/nvim
ln -s $HOME/.vimrc $HOME/.vim/init.vim
