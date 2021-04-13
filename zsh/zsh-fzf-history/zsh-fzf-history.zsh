function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --layout=reverse --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history
