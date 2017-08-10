# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/opt/bin" ] ; then
    PATH="$HOME/opt/bin:$PATH"
fi

# Common Environmental Variables
export LANG=ja_JP.UTF-8

# Common aliases
alias crontab='crontab -i'
alias grep='grep --color=auto'
alias df='df -h'
alias tmux='tmux -u2'
alias bye=exit
alias la='ls --color -aF'
alias lf='ls --color -AF'
alias ll='ls --color -lhA'
alias ls='ls --color -hF'

# TMUX/Screen autoload cancellation when connecting by SCP
if [ -z "$PS1" ]; then
    return;
fi

# TMUX autoload since login
#if [ -z $TMUX ]; then
#  if $(tmux has-session 2> /dev/null); then
#    exec tmux -u2 attach
#  else
#    exec tmux -u2
#  fi
#fi

# GNU Screen autoload
#if [ $TERM != "screen" ]; then
#  if [ $TERM != "dumb" ]; then
#    exec screen -xR
#  fi
#fi
