# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/opt/bin" ] ; then
    PATH="$HOME/opt/bin:$PATH"
fi

# Environmental Variables

# TMUX autoload since login
if [ -z $TMUX ]; then
  if $(tmux has-session 2> /dev/null); then
    exec tmux -2 attach
  else
    exec tmux -2
  fi
fi

