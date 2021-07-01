# The following lines were added by compinstall

zstyle ':completion:*' menu select
zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}'
zstyle  :compinstall   filename "/home/$USER/.zshrc"

# End of lines added by compinstall

# Lines configured by zsh-newuser-install

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

# End of lines configured by zsh-newuser-install

# cd Stacking 
DIRSTACKSIZE=25
setopt AUTO_PUSHD
zstyle ':completion:*:cd:*' ignore-parents parent pwd
alias dirs="dirs -v | head -n 10"

# COMPINIT!
autoload -Uz compinit && compinit

# Check availability of gnuls
if [[ $(uname) =~ BSD$ || $(uname) == DragonFly ]]; then
    if [ -x "`which gnuls 2> /dev/null`" ]; then
        LS="gnuls --color"
    elif [ -x "`which gls 2> /dev/null`" ]; then
        LS="gls --color"
    else
        LS="ls -G"
    fi
else
    LS="ls --color"
fi

# Prompt
case "$TERM" in
xterm*|rxvt*|*-256color)
	PROMPT="
%F{green}%n@%m%f %F{cyan}%/%f
%# "
	;;
*)
	PROMPT="
%n@%m %/
%# "
	;;
esac

# adapt zsh-syntax-highlighting
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# adapt dircolors-solarized
if [ -f ~/.zsh/dircolors-solarized/dircolors.256dark ]; then
    if [ -x "`which dircolors 2> /dev/null`" ]; then
	eval `dircolors ~/.zsh/dircolors-solarized/dircolors.256dark`
	zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
    elif [ -x "`which gdircolors 2> /dev/null`" ]; then
	eval `gdircolors ~/.zsh/dircolors-solarized/dircolors.256dark`
	zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
    fi
fi

# Options
stty stop undef

# Common aliases
alias grep='grep --color=auto'
alias df='df -h'
alias tmux='tmux -u2'
alias bye=exit
alias emacs='$HOME/local/bin/edit'
alias la="${LS} -aF"
alias lf="${LS} -AF"
alias ll="${LS} -lh"
alias ls="${LS} -hF"
alias trs="traceroute -I"

# zsh hooks
setopt auto_cd
function chpwd(){ ls }

# Load custom aliases
if [ -f ~/.alias ]; then
  source ~/.alias
fi

# Environmental variables
if [ -f ~/.export ]; then
  source ~/.export
fi

# Show banner
if [ -f ~/.banner ]; then
        xargs --null echo -ne < ~/.banner
fi

# Use fzf for complementation and shell history
[ -f ~/.zsh/zsh-fzf-history/zsh-fzf-history.zsh ] && source ~/.zsh/zsh-fzf-history/zsh-fzf-history.zsh

