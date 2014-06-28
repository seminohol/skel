# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename "/home/$USER/.zshrc"

autoload -Uz compinit
compinit

setopt auto_cd
function chpwd(){ ls -F --color }

# End of lines added by compinstall


# Lines configured by zsh-newuser-install

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

# End of lines configured by zsh-newuser-install


# adapt zsh-syntax-highlighting
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# adapt dircolors-solarized
if [[ -f ~/.zsh/dircolors-solarized/dircolors.256dark && -x `which dircolors` ]]; then
  eval `dircolors ~/.zsh/dircolors-solarized/dircolors.256dark`
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
fi

# Aliases
alias h='history 25'
alias j='jobs -l'
alias la='ls -aF --color'
alias lf='ls -AF --color'
alias ll='ls -lhA --color'
alias ls='ls -hF --color'
alias df='df -h'
alias tmux='tmux -2'
alias bye=exit

# Prompt
prompt="
%n@%m %/
%# "

# Environment variables
export PATH=$PATH:$HOME/bin
export GREP_OPTIONS='--color=auto'
export LANG=ja_JP.UTF-8
