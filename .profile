# Only run in interactive shells
[[ $- == *i* ]] || return

export XDG_CONFIG_HOME="$HOME/.config"

bashrc_file="$XDG_CONFIG_HOME/bash/bashrc"
[[ -f $bashrc_file ]] && source "$bashrc_file"

