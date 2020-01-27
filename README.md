# Fishsticks

```console
#!/bin/bash
sudo apt-get install fish -y
sudo chsh -s `which fish`
cd .config/fish
git clone https://github.com/dylanlrrb/fishsticks.git
cd fishsticks
git checkout <YOUR_ENV(macos or linux)>
cp config.fish ..
```
