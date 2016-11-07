#!/bin/bash

l() {
	ln -s $(pwd)/$1 $2
}

l vimrc $HOME/.vimrc
l xinitrc $HOME/.xinitrc
l xprofile $HOME/.xprofile
l zprofile $HOME/.zprofile
l i3/i3 $HOME/.config/i3/config
l i3/i3status $HOME/.config/i3status/config
l zshrc.local $HOME/.zshrc.local
l vifmrc $HOME/.vifm/vifmrc
