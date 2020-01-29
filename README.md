# Install packages

```console
sudo apt-get update
sudo apt-get install curl ifconfig git vim nano zip less open-ssh -y
sudo apt-get remove docker docker-engine docker.io
sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo groupadd docker
sudo usermod -aG docker $USER
```
