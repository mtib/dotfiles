#!/bin/bash
pacman -Syu
p() {
    pacman -S $1
}

p thunar
p texmaker
p texlive-core
