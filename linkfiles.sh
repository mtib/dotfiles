#!/bin/bash

l() {
    ln -s $1 $2
}

l vimrc $HOME/.vimrc
l xinitrc $HOME/.xinitrc
l xprofile $HOME/.xprofile
l zprofile $HOME/.zprofile
