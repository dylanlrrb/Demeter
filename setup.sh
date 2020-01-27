#!/bin/bash

os="$(uname -s)"
if [ $os -eq "Darwin" ]
then
    brew install fish
else
    sudo apt-get install fish -y
fi
cd ~/.config/fish
git clone https://github.com/dylanlrrb/fishsticks.git
cd fishsticks
if [ $os -eq "Darwin" ]
then
    git checkout macos
else
    git checkout linux
fi
cp config.fish ..
chsh -s `which fish`
cd ~
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
