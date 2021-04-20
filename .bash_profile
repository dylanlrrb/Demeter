function updateprofile() {
  cd ~/fishsticks
  git checkout darwin
  git pull origin darwin
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
alias fishsticks='cd ~/fishsticks'

### DIRECTORY ALIASES

alias lsa='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias D='cd ~/Desktop'
alias cl='clear'
### alias screeps 'cd ~/Library/Application\ Support/Screeps/scripts/'

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

### ASM Helpers
function compile() {
  nasm -f elf64 $argv.asm -o $argv.o & ld $argv.o -o $1
}

# disassemble
function dis() {
  objdump -d $1
}

### C Helpers

function c() {
  gcc $argv.c -o $1
}

### Jupyter Notebook stuff

alias jp='jupyter notebook --no-browser'

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

# for restricting pernisions on directories and files
# (only the owner can read)
alias restrict="chmod 400 "

# for opening up permissions on .sh scripts so they can be executed
alias permit="chmod +x "


updateprofile
