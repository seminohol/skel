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

# PROMPT
case "$TERM" in
xterm*|rxvt*|*-256color)
    PROMPT="
%F{green}%n@%m%f %F{blue}%/%f
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
if [[ -f ~/.zsh/dircolors-solarized/dircolors.256dark && -x `which dircolors` ]]; then
  eval `dircolors ~/.zsh/dircolors-solarized/dircolors.256dark`
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
fi

# adapt zsh-peco-history
if [[ -f ~/.zsh/zsh-peco-history/zsh-peco-history.zsh && -x `which peco` ]]; then
    source ~/.zsh/zsh-peco-history/zsh-peco-history.zsh
fi

# Options
stty stop undef

# Common aliases
alias crontab='crontab -i'
alias grep='grep --color=auto'
alias df='df -h'
alias tmux='tmux -u2'
alias bye=exit
alias emacs='$HOME/opt/bin/edit'

alias la="${LS} -aF"
alias lf="${LS} -AF"
alias ll="${LS} -lhA"
alias ls="${LS} -hF"

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
        source ~/.banner
fi
