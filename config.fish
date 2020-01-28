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

### DIRECTORY ALIASES

alias lsa 'ls -a'
alias ll 'ls -l'
alias lla 'ls -la'
alias D 'cd ~/Desktop'

### SSH HELPERS

# Usage: `ai <address of instance>` 
function ai 
  ssh -i ~/.ssh/aws-dylan-r-lrrb.pem -L 8888:localhost:8888 ubuntu@$argv
end

function micro
  ssh -i ~/.ssh/aws-dylan-r-lrrb.pem ec2-user@ec2-34-210-224-29.us-west-2.compute.amazonaws.com
end

### RANDOM HELPERS

function ip
  ifconfig en0 | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'
end



### Conda working with fish

export PATH="~/miniconda3/bin:$PATH"
source ~/miniconda3/etc/fish/conf.d/conda.fish

function freeze
  set os (uname -s)
  conda env export --no-builds > "$os-environment.yaml"
  pip freeze > "$os-requirements.txt"
end

alias activate 'conda activate '


function mount
  cd ~
  lsblk
  mkdir projects
  sudo mount /dev/xvdf projects
  sudo chown `whoami` projects
end

### Jupyter Notebook stuff


alias jp 'jupyter notebook --no-browser --port=8889'
alias html 'jupyter nbconvert --to html '

### MISC

# for restricting pernisions on public keys
alias restrict "chmod 400 "

# for opening up permissions on .sh scripts
alias permit "chmod +x "

# turn off the desktop in one minute and exit
function off 
  sudo shutdown -h 1
  exit
end

updatefish
