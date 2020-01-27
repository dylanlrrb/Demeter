#!/bin/bash

os=`echo "$(uname -s)" | tr "[:upper:]" "[:lower:]"`
if [ "$os" == "darwin" ]
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
curl -L https://get.oh-my.fish | fish
cd ~
omf install bobthefish
echo "Please restart your shell"
