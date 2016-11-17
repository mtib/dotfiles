#!/bin/bash
pacman -Syu
p() {
    pacman -S $1
}

p thunar
p texmaker
p texlive-core
p python2-twisted
p python2-argparse
git clone https://go.googlesource.com/image
cp image/font/gofont/ttfs/*.ttf /usr/share/fonts/TTF/
rm -rf image
