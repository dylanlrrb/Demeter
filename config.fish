function updatefish
  cd ~/.config/fish/fishsticks
  git checkout linux
  git pull origin linux
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

### RANDOM HELPERS

alias profile 'less ~/.config/fish/config.fish'

function ip
  ifconfig en0 | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'
end

## AWS Volume helper
# function mount
#   cd ~
#   lsblk
#   mkdir projects
#   sudo mount /dev/xvdf projects
#   sudo chown `whoami` projects
# end

### Jupyter Notebook stuff


alias jp 'jupyter notebook --no-browser --port=8889'

## Python stuff

alias python "python3 "
alias pip "pip3 "

#Virtualenvwrapper settings:

eval (python -m virtualfish)

# Python Version Install
# Usage:   pvi <version-number>
# Example: pvi 3.4
function pvi
  sudo apt-get install python$argv -y
end

alias lspy "ls /usr/bin/ | grep 'python'"

# Usage:   createnv <version> <env-name>
# Example: createnv python3.4 ai3_4
function createnv
  virtualenv  --python=/usr/bin/$argv[1] ~/.virtualenv/$argv[2]
end

function activatenv
  source ~/.virtualenv/$argv/bin/activate.fish
end

function removenv
  rm -rf ~/.virtualenv/$argv
end

alias lsenv "ls -F ~/.virtualenv/ | grep \/ | tr -d '/,'"

alias deactivatenv "deactivate"

### MISC

alias d "docker "

alias x "exit"

# continually display gpu stats, kinda like htop
alias gtop "watch -n 1 nvidia-smi"

# like top but for showing network activity/bandwidth
alias iftop "sudo iftop"

# for restricting pernisions on public keys
# (only the owner can read)
alias restrict "chmod 400 "

# for opening up permissions on .sh scripts so they can be executed
alias permit "chmod +x "

# turn off the desktop in one minute and exit
function off 
  sudo shutdown -h 1
  exit
end

updatefish
