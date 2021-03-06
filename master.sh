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
wget -O $HOME/.i3/py3status/cmus.py https://raw.githubusercontent.com/raspbeguy/py3status-cmus/6cc20b6adb417e6b6c147c004943a9a0355ec2b9/cmus.py
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
echo -n "installing aur software "
source aurinstall.sh
echo "done"

# move binaries folder
echo -n "creating $HOME/bin folder "
cp $pwd/bin/* $HOME/bin/.
echo "... [done]"

echo "for the java checkstyle to work - you will need to download the jar and xml yourself"
echo "finish! HAVE FUN -mtib"
