#!/bin/bash

sudo apt -y update
# basic packages
sudo apt install curl ifconfig iftop git vim nano zip unzip less open-ssh htop python3-pip -y
pip3 install --upgrade pip -y
sudo pip3 install virtualenv -y
# allow the installation of other python versions
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt-get update -y
# deps for docker
sudo apt -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
# remove docker if its there and install
sudo apt remove docker docker-engine docker.io containerd runc
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# make sure to use bash so string templating works
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update -y
sudo apt -y install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl enable docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
# stuff for the docker-nvidia container
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker
# steam stuff (if needed)
# sudo apt-get install nvidia-driver-430
# there may be more up to date and better versions of nvidia-driver, eg. nvidia-driver-435, nvidia-driver-440 etc.
# sudo dpkg --configure -a
# reboot computer
