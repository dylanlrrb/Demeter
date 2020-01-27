function updatefish
  cd ~/.config/fish/fishsticks
  git checkout darwin
  git pull origin darwin
  cp config.fish ..
  cd ~
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

### DIRECTORY ALIASES

alias lsa 'ls -a'
alias ll 'ls -l'
alias lla 'ls -la'
alias D 'cd ~/Desktop'
### alias screeps 'cd ~/Library/Application\ Support/Screeps/scripts/'

### SSH HELPERS

# Usage: `ai <address of instance>` 
function ai 
  ssh -i ~/.ssh/aws-dylan-r-lrrb.pem -L 8888:localhost:8888 ubuntu@$argv
end

function cr10
  ssh -i ~/.ssh/cr10_rsa pi@dylancr10.ddns.net
end

function micro
  ssh -i ~/.ssh/aws-dylan-r-lrrb.pem ec2-user@ec2-34-210-224-29.us-west-2.compute.amazonaws.com
end

function mybox
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
  gcc $argv.c -o $argv & eval ./$argv
end


### Conda working with fish

export PATH="/Users/dylanlarrabee/miniconda3/bin:$PATH"
source ~/miniconda3/etc/fish/conf.d/conda.fish

function freeze
  set os (uname -s)
  conda env export --no-builds > "$os-environment.yaml"
  pip freeze > "$os-requirements.txt"
end

alias activate 'conda activate '

### Jupyter Notebook stuff

# Tool used for converting to PDF
export PATH="/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin:$PATH"

alias jp 'jupyter notebook'
alias html 'jupyter nbconvert --to html '
alias pdf 'jupyter nbconvert --to pdf '

### MISC

# for restricting pernisions on public keys
alias restrict "chmod 400 "

# for opening up permissions on .sh scripts
alias permit "chmod +x "

### SET NODE VERSION ON START

nvm use v8.11.1

### SET UP SECRETS ON START
### not really sure how to use rn
### . ~/.config/fish/secrets.fish

### ADD GITHUB KEY PAIR

### ssh-add -K ~/.ssh/wwkp

updatefish
