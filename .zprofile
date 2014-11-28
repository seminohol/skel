# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/opt/bin" ] ; then
    PATH="$HOME/opt/bin:$PATH"
fi

# Environmental Variables

# Launch byobu
`echo $- | grep -qs i` && byobu-launcher && exit 0
