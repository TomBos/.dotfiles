# Only run in interactive shells
[[ $- == *i* ]] || return

export XDG_CONFIG_HOME="$HOME/.config"

if [[ -f "$XDG_CONFIG_HOME/bash/bashrc" ]]; then
  source "$XDG_CONFIG_HOME/bash/bashrc"
fi

