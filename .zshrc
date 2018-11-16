# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename "/home/$USER/.zshrc"

autoload -Uz compinit
compinit

# End of lines added by compinstall


# Lines configured by zsh-newuser-install

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

# End of lines configured by zsh-newuser-install

# zsh colorizing 
setopt auto_cd
if [[ $(uname) =~ BSD$ || $(uname) == DragonFly ]]; then
    if [ -x /usr/local/bin/gnuls ]; then
        function chpwd(){ gnuls -F --color }
    else
        function chpwd(){ ls -G }
    fi
else
    function chpwd(){ ls -F --color }
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

# Options
stty stop undef

# Common aliases
alias crontab='crontab -i'
alias grep='grep --color=auto'
alias df='df -h'
alias tmux='tmux -u2'
alias bye=exit
alias emacs='$HOME/opt/bin/edit'

if [[ $(uname) =~ BSD$ || $(uname) == DragonFly ]]; then
    if [ -x /usr/local/bin/gnuls ]; then
        alias la='gnuls --color -aF'
        alias lf='gnuls --color -AF'
        alias ll='gnuls --color -lhA'
        alias ls='gnuls --color -hF'
    else
        alias la='ls -GaF'
        alias lf='ls -GAF'
        alias ll='ls -GlhA'
        alias ls='ls -GhF'
    fi
else
    alias la='ls --color -aF'
    alias lf='ls --color -AF'
    alias ll='ls --color -lhA'
    alias ls='ls --color -hF'
fi

if [ -f ~/.alias ]; then
  source ~/.alias
fi

# Environmental variables
if [ -f ~/.export ]; then
  source ~/.export
fi

# Banner
if [ -f ~/.banner ]; then
        source ~/.banner
fi
