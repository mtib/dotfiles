#!/bin/bash
pacman -Syu
p() {
    pacman -S $1
}

p thunar
p texmaker
p texlive-core
git clone https://go.googlesource.com/image
cp image/font/gofont/ttfs/*.ttf /usr/share/fonts/TTF/
rm -rf image
