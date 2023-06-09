function updateprofile() {
  cd ~/dotfiles
  git checkout .
  git checkout linux
  git pull origin linux
  cp .bash_profile ..
  cd ~
}

### GIT HELPERS

alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias ob='git branch --sort=-committerdate '
alias gc='git commit'
alias gd='git diff'
alias gpsh='git push'
alias gpu='git push -u origin HEAD'
alias gpl='git pull'
alias go='git checkout '
alias gri='git rebase -i'
alias got='git '
alias get='git '
alias gti='git '
alias ob='git branch --sort=committerdate '
alias gsd='git status; git diff'
alias gm='git merge'
alias log='git log'
alias hist="log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
alias hsit='hist '
alias h='hist -5'
alias clean='git clean -i'
alias code='open -a Visual\ Studio\ Code'
alias profile='code ~/.bash_profile'

### DIRECTORY ALIASES

alias lsa='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias D='cd ~/Desktop'
alias cl='clear'
alias count_in_dirs='du -a | cut -d/ -f2 | sort | uniq -c'
alias find_corrupted_images='feh -ur .'

### SSH HELPERS

# Usage: `ai <address of instance>` 
function ai() { 
  ssh -i ~/.ssh/aws-dylan-r-lrrb.pem -L 8888:localhost:8888 ubuntu@$1
}

alias cr10='ssh -i ~/.ssh/cr10_rsa pi@192.168.0.15'

alias homebase='ssh -i ~/.ssh/homebase_rsa pi@192.168.0.20'

alias micro='ssh -i ~/.ssh/aws-dylan-r-lrrb.pem ec2-user@ec2-34-210-224-29.us-west-2.compute.amazonaws.com'

alias x='ssh -i ~/.ssh/desktop_rsa  dylan@192.168.0.19'

### RANDOM HELPERS

alias ip="ifconfig en0 | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"

alias s="python -m http.server 8080"

## AWS Volume helper
# function mount
#   cd ~
#   lsblk
#   mkdir projects
#   sudo mount /dev/xvdf projects
#   sudo chown `whoami` projects
# end

### Jupyter Notebook stuff

alias jp='jupyter notebook --no-browser'

### Hugging Face token stuff

alias hfread='huggingface-cli login --token $HF_READ'
alias hfwrite='huggingface-cli login --token $HF_WRITE'

## Python stuff

alias python="python3 "

alias pip="pip3 "

# Pyenv stuff
# https://realpython.com/intro-to-pyenv/#installing-pyenv

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Python Version Install
# needs pyenv installed with brew
# pvi <python_version>
function pvi() {
  pyenv install $1
}

# list installed python versions
# there will be an astrisk next ti the currently active env
alias lspy="pyenv versions"

# createnv <python_version> <environment_name>
alias createnv='pyenv virtualenv '

# activatenv <environment_name>
alias activate='pyenv local '

function removenv() {
  rm -rf ~/.pyenv/versions/$1
}

alias lsenv="pyenv virtualenvs"

alias deactivate="pyenv local system"

### MISC

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
os() {
 uname -s
}
PS1="\[\e[36m\]\$(os) $(python -V)\[\e[m\] \W \[\e[33m\]\$(git_branch)\[\e[m\]$ "

alias d="docker "
alias dwd="cd ../tf/notebooks"

alias x="exit"

# continually display gpu stats, kinda like htop
alias gtop="watch -n 1 nvidia-smi"

# like top but for showing network activity/bandwidth
alias iftop="sudo iftop"

# for restricting pernisions on public keys
# (only the owner can read)
alias restrict="chmod 400 "
alias release="sudo chown -R dylan " # <directory> change the premissions for an entire directory

# for opening up permissions on .sh scripts so they can be executed
alias permit="chmod +x "

# turn off the desktop in one minute and exit
function off() {
  sudo shutdown -h 1
  exit
}

updateprofile
