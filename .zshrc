function updateprofile() {
  cd ~/Demeter/src
  git checkout .
  git checkout darwin
  git pull origin darwin
  cd -
  cd ~/Demeter/Demeter
  git checkout .
  git checkout darwin
  git pull origin darwin
  cd -
}

ssh-add ~/.ssh/desktop_rsa

### GIT HELPERS

alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias ob='git branch --sort=-committerdate '
alias gc='git commit'
alias gd='git diff'
alias gpsh='git push'
alias gpu='git push -u'
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

alias profile='nano ~/.zshrc'

### DIRECTORY ALIASES

alias lsa='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias cl='clear'

alias count_in_dirs='du -a | cut -d/ -f2 | sort | uniq -c'
alias find_corrupted_images='feh -ur .'

### SSH HELPERS

alias cr10='ssh -i ~/.ssh/cr10_rsa pi@192.168.0.15'

alias x='ssh -i ~/.ssh/desktop_rsa dylan@homebasenet.ddns.net'

### RANDOM HELPERS

alias tfon='x "bash Artemis/docker/tf/run.sh"'
alias tfoff='x "docker stop Artemis"'
alias torchon='x "bash Artemis/docker/torch/run.sh"'
alias torchoff='x "docker stop Artemis"'


### Docker stuff
alias d="docker "
# docker context create pc-context --docker "host=ssh://dylan@homebasenet.ddns.net"
# docker context use pc-context
# need to run `ssh-add ~/.ssh/desktop_rsa`
# and needs an appropriate ~/.ssh/config
# or you will get a permission denied error
alias sad="ssh-add ~/.ssh/desktop_rsa"

### Jupyter Notebook stuff

alias jp='jupyter notebook --no-browser'


# for restricting pernisions on directories and files
# (only the owner can read)
alias restrict="chmod 400 "

# for opening up permissions on .sh scripts so they can be executed
alias permit="chmod +x "


updateprofile
