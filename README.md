# fishsticks

```console
#!/bin/bash
sudo apt-get install fish -y
touch .bash_profile
echo "fish" >> .bash_profile
cd .config/fish
git clone https://github.com/dylanlrrb/fishsticks.git
cd fishsticks
cp config.fish ..
```
