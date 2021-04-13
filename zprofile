# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/local/bin" ] ; then
    PATH="$HOME/local/bin:$PATH"
fi

if [ -d "$HOME/local/go/bin" ] ; then
    PATH="$HOME/local/go/bin:$PATH"
fi

# Common Environmental Variables
export LANG=ja_JP.UTF-8
export EDITOR=$HOME/local/bin/edit

# TMUX/Screen autoload cancellation when connecting by SCP
if [ -z "$PS1" ]; then
    return;
fi

# Fix zsh git complementation slows
__git_files () { 
    _wanted files expl 'local files' _files  }

# TMUX autoload
if [ -e "$HOME/.tmux.enabled" ]; then
    if [ -z $TMUX ]; then
	echo -n "Connect TMUX? [Y/n]: "
	read ANSWER
	case $ANSWER in
	    "" | "Y" | "y" | "yes" | "Yes" | "YES" );;
	    * ) return;;
	esac
	
	if $(tmux has-session 2> /dev/null); then
	    exec tmux -u2 attach
	else
	    exec tmux -u2
	fi
    fi
fi

# GNU Screen autoload
#if [ $TERM != "screen" ]; then
#    if [ $TERM != "dumb" ]; then
#	exec screen -xR
#    fi
#fi
