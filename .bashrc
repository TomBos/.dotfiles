# Only interactive use
[[ $- == *i* ]] || return

# Start Hyprland
if [[ -z "$DISPLAY" ]] && [[ "$(tty)" == "/dev/tty1" ]];then
  export $XDG_SESSION_TYPE=wayland
  dbus-run-session Hyprland
fi


# Source prompt config
if [[ -f "$HOME/.bash_prompt" ]]; then
	. "$HOME/.bash_prompt"
else
	export PS1="\u@\h:\w\$ "
fi


# Ensure correct PATH
export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin"


# Load custom aliases if available
if [[ -f "$HOME/.bash_aliases" ]]; then
    . "$HOME/.bash_aliases"
fi


# Enable Bash autocompletion support (Arch-style)
if [[ -f "/usr/share/bash-completion/bash_completion" ]]; then
    . "/usr/share/bash-completion/bash_completion"
fi


# Load Custom exports and paths
if [[ -d "$HOME/.exports" ]]; then
	for file in "$HOME/.exports/"*; do
		if [[ -f "$file" ]]; then
			. "$file"
		fi
	done
fi


# Load custom bash functions
if [[ -f "$HOME/.bash_functions" ]]; then
    . "$HOME/.bash_functions"
fi
