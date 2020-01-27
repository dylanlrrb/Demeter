#!/bin/bash

sudo apt-get install fish -y
cd ~/.config/fish
git clone https://github.com/dylanlrrb/fishsticks.git
cd fishsticks
os="$(uname -s)"
if [ $os -eq "Darwin" ]
then
    git checkout macos
else
    git checkout linux
fi
cp config.fish ..
chsh -s `which fish`
cd ~
