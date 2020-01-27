#!/bin/bash

os="$(uname -s)"
if [ "$os" == "Darwin" ]
then
    brew install fish
else
    sudo apt-get install fish -y
fi
cd ~/.config/fish
git clone https://github.com/dylanlrrb/fishsticks.git
cd fishsticks
git checkout $os
cp config.fish ..
chsh -s `which fish`
cd ~
echo "Please restart your shell"
