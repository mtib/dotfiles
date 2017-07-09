#!/bin/zsh

l() {
	ln -s $(pwd)/$1 $2
}

_l () {
    l $1 $HOME/.$1
}

_l vimrc
_l svimrc
_l xinitrc
_l xprofile
_l zprofile
_l feh_update
_l feh_constants
_l gitignore
_l Xresources
mkdir -p $HOME/.config/i3{,status}
l i3/i3 $HOME/.config/i3/config
mkdir -p $HOME/.i3/py3status
l i3/i3status $HOME/.config/i3status/config
l zshrc.local $HOME/.zshrc.local
mkdir -p $HOME/.vifm
l vifmrc $HOME/.vifm/vifmrc
_l tmux
mkdir -p $HOME/.config/ranger
l rangerrc $HOME/.config/ranger/rc.conf
# link nvim config to vim
_l scrot
ln -s $HOME/.vim $HOME/.config/nvim
ln -s $HOME/.vimrc $HOME/.vim/init.vim


(
    cd rando_scripts
    for f in *; do
        _l $f
    done
)
