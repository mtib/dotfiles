#!/usr/bin/bash
pwd=$(pwd)
echo "running script to configure whole computer"
echo "made for and by markus <mtib> becker"
echo "last tested arch version: 4.8.8-2-ARCH"
echo "PWD: $pwd"
echo "USER: $USER"
echo "HOME: $HOME"

# link config files
echo -n "linking configuration files "
source linkfiles.sh
echo "... [done]"

# setup git
echo -n "setting git global variables "
source gitsetup.sh
echo "... [done]"

# install software
echo -n "installing software (pacman) "
source software.sh
echo "... [done]"

# downloading grml-zsh-config
echo -n "grml zsh config --> .zshrc "
wget -O $HOME/.zshrc http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc
echo "... [done]"

# prepare vim
echo -n "installing vim plugins "
mkdir -p $HOME/.vim
source pathogen.sh
echo "... [done]"

# i3 scripts
echo "sudo access to install i3 scripts: "
sudo mkdir -p /usr/share/i3scripts
sudo cp louder.sh /usr/share/i3scripts/louder.sh
sudo cp quieter.sh /usr/share/i3scripts/quieter.sh
echo "done"

read -p "create new ssh key (y/n)?" choice
case "$choice" in 
    y|Y ) ssh-keygen;;
    n|N ) echo "nothing to be done here...";;
    * ) echo "... that's not what I expected :(";;
esac
echo "done"

# making important directory
for d in go github bin ; do 
    echo "creating $HOME/$d"
    mkdir $HOME/$d
done
echo "done"

# cloning important git repos
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
echo -n "installing aur software "
ai discord-canary
ai vertex-themes-git
ai arc-faenza-icon-theme
ai ttf-mononoki-git
ai otf-fira-code
ai atom-editor-bin
ai i3-git 
ai i3-vim-syntax-git
ai i3lock-fancy-git
echo "done"

# move binaries folder
echo -n "creating $HOME/bin folder "
cp $pwd/bin/* $HOME/bin/.
echo "... [done]"

echo "for the java checkstyle to work - you will need to download the jar and xml yourself"
echo "finish! HAVE FUN -mtib"
