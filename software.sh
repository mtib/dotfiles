#!/bin/bash
pacman -Syu
p() {
    sudo pacman -S $1
}

p base-devel
p git wget curl zsh gvim openssh tmux
p vifm neovim python2-neovim python-neovim
p imagemagick jre8-openjdk xorg-server xorg-utils xorg-server-utils thunderbird 
p transmission-gtk tree tlp teamspeak3 unrar
p ttf-roboto thunar-archive-plugin smplayer simplescreenrecorder
p rust ruby cmake pulseaudio pitivi php nodejs npm lua linux-headers less arandr 
p aspell aspell-de audacity autoconf automake lxappearance cloc cups rofi eog evince 
p exfat-utils ffmpeg feh filezilla htop hunspell hunspell-de hunspell-en 
p i3lock i3status i3
p xfce4-terminal
p pavucontrol
p xclip
p udisks2 udiskie
p baobab
p thunar
p gvim
p texmaker
p gource
p texlive-core
