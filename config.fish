
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

### DIRECTORY ALIASES

alias lsa 'ls -a'

### RANDOM HELPERS

function ip
  ifconfig en0 | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'
end


### Conda working with fish

export PATH="~/anaconda3/bin:$PATH"
source ~/anaconda3/etc/fish/conf.d/conda.fish

alias freeze 'conda env export > environment.yaml ; and pip freeze > requirements.txt'
alias activate 'conda activate '

function mount
  cd ~
  lsblk
  mkdir projects
  sudo mount /dev/xvdf projects
  sudo chown `whoami` projects
end

alias P 'cd projects'
