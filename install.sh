#!/bin/bash

sudo apt -y update
sudo apt install -y curl openssh-server iftop git vim nano zip unzip less htop python3-pip
sudo apt-get install -y openssh-server make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev

git config --global user.email "dylan.r.larrabee@gmail.com"
git config --global user.name "Dylan Larrabee

# https://catalog.ngc.nvidia.com/orgs/nvidia/containers/pytorch
# https://www.tensorflow.org/install/docker

# I had the linux setup install recommended packages and the correct nvidia drivers were installed
# install docker 
# https://docs.docker.com/engine/install/ubuntu/
# restart docker 
sudo systemctl start docker
sudo systemctl enable docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl restart docker
# install nvidia container toolkit
# https://github.com/NVIDIA/nvidia-container-toolkit?tab=readme-ov-file
# reboot computer
