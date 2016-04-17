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

# zsh-only Custom Configurations
setopt auto_cd
function chpwd(){ ls -F --color }

# Prompt
prompt="
%n@%m %/
%# "

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
