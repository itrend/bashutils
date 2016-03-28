alias ls='ls --color -F'
alias ll='ls -l'
alias brewup="brew update && brew upgrade --all && brew cleanup && brew cask cleanup"
alias ..='cd ..'
alias cd..='cd ..'
alias got='git'


# Timer prompt stuff

function timer_start {
  timer=${timer:-$SECONDS}
}

function timer_stop {
  timer_show=$(($SECONDS - $timer))
  unset timer
}

GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
RED="$(tput setaf 1)"
RESET="$(tput setaf sgr0)"

function save_exit_code {
  exit_code="$?"
  if [ $exit_code != 0 ]; then
    exit_code="$exit_code"
    exit_code_color="$RED"
  else
    exit_code="OK"
    exit_code_color="$GREEN"
  fi
}

trap 'timer_start' DEBUG

MY_PROMPT_COMMANDS="save_exit_code; timer_stop"
if [ "$PROMPT_COMMAND" == "" ]; then
  PROMPT_COMMAND=$MY_PROMPT_COMMANDS
else
  PROMPT_COMMAND="$PROMPT_COMMAND; $MY_PROMPT_COMMANDS"
fi

##

if [ -z "$SSH_TTY" ]; then
  # local prompt - no user and host
  #export PS1='[\[\033[1;33m\]$(date +%H%M%S)\[\033[0m\]]\[\033[1;34m\]\w\[\033[0m\]\$ '
  export PS1='[\[\033[0;32m\]$(date +%H:%M:%S)\[\033[0m\]] [\[${exit_code_color}\]${exit_code}\[\033[m\]] [\[\033[0;33m\]${timer_show}s\[\033[0m\]] \[\033[1;34m\]\w\[\033[0m\] \[\033[0;32m\]$(__git_ps1 "(%s)")\[\033[00m\]\n\$ '
else
  # if connected over ssh - show user and host as well - \[\033[1;32m\]\u@\[\033[1;31m\]\h:
  export PS1='[\[\033[0;32m\]$(date +%H:%M:%S)\[\033[0m\]] [\[${exit_code_color}\]${exit_code}\[\033[m\]] [\[\033[0;33m\]${timer_show}s\[\033[0m\]] \[\033[1;32m\]\u@\[\033[1;31m\]\h \[\033[1;34m\]\w\[\033[0m\]\n\$ '
fi

export PYTHONSTARTUP=$HOME/.pythonrc.py
export EDITOR=vim

eval $(docker-machine env default)

export PATH="$PATH:$HOME/bin"
