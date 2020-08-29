function updatefish
  cd ~/.config/fish/fishsticks
  git checkout darwin
  git pull origin darwin
  cp config.fish ..
  cd ~
  set -g theme_powerline_fonts no
end

### GIT HELPERS

alias gs 'git status '
alias ga 'git add '
alias gb 'git branch '
alias ob 'git branch --sort=-committerdate '
alias gc 'git commit'
alias gd 'git diff'
alias gpsh 'git push'
alias gpl 'git pull'
alias go 'git checkout '
alias gri 'git rebase -i'
alias got 'git '
alias get 'git '
alias gti 'git '
alias ob 'git branch --sort=committerdate '
alias gsd 'git status; git diff'
alias gm 'git merge'
alias log 'git log'
alias hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
alias clean 'git clean -i'
alias code 'open -a Visual\ Studio\ Code'
alias profile 'code ~/.config/fish/config.fish'
alias fishsticks 'cd ~/.config/fish/fishsticks'

### DIRECTORY ALIASES

alias lsa 'ls -a'
alias ll 'ls -l'
alias lla 'ls -la'
alias D 'cd ~/Desktop'
alias cl 'clear'
### alias screeps 'cd ~/Library/Application\ Support/Screeps/scripts/'

### SSH HELPERS

# Usage: `ai <address of instance>` 
function ai 
  ssh -i ~/.ssh/aws-dylan-r-lrrb.pem -L 8888:localhost:8888 ubuntu@$argv
end

function cr10
  ssh -i ~/.ssh/cr10_rsa pi@dylancr10.ddns.net
end

function cr10_local
  ssh -i ~/.ssh/cr10_rsa pi@192.168.0.15
end

function homebase
  ssh -i ~/.ssh/homebase_rsa pi@homebasenet.ddns.net
end

function micro
  ssh -i ~/.ssh/aws-dylan-r-lrrb.pem ec2-user@ec2-34-210-224-29.us-west-2.compute.amazonaws.com
end

function x
  ssh -i ~/.ssh/desktop_rsa  dylan@192.168.0.19
end

### RANDOM HELPERS

function ip
  ifconfig en0 | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'
end

function nvm
  bass source ~/.nvm/nvm.sh ';' nvm $argv
end

function node6
  nvm use v6
end

function node8
  nvm use v8
end

function node10
  nvm use v10
end

### ASM Helpers
function compile
  nasm -f elf64 $argv.asm -o $argv.o & ld $argv.o -o $argv
end

function dis
  objdump -d $argv
end

### C Helpers

function c
  gcc $argv.c -o $argv
end

### Jupyter Notebook stuff

alias jp 'jupyter notebook --no-browser'

## Python stuff

alias python "python3 "

alias pip "pip3 "

# Python Version Install
# Usage:   pvi <version-number>
# Example: pvi 3.6.9 (must contain micro version)
# needs pyenv installed with brew
function pvi
  pyenv install $argv
end

alias lspy "ls /Users/$USER/.pyenv/versions/"

# Usage:   createnv <version> <minor-version> <env-name>
# Example: createnv 3.6.9  ai3_6 (must specify micro version)
function createnv
  set major (echo $argv[1] | cut -d'.' -f1)
  set minor (echo $argv[1] | cut -d'.' -f2)
  set version "$major.$minor"
  virtualenv --python=/Users/$USER/.pyenv/versions/$argv[1]/bin/python$version ~/.virtualenvs/$argv[2]
end

function activatenv
  source ~/.virtualenvs/$argv/bin/activate.fish
end

function removenv
  rm -rf ~/.virtualenvs/$argv
end

alias lsenv "ls -F ~/.virtualenvs/ | grep \/ | tr -d '/,'"

alias deactivatenv "deactivate"


### MISC

# for restricting pernisions on directories and files
# (only the owner can read)
alias restrict "chmod 400 "

# for opening up permissions on .sh scripts so they can be executed
alias permit "chmod +x "

### SET NODE VERSION ON START
# nvm use v8.11.1

updatefish
