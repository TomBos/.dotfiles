# Minimal .bashrc
export LANG="en_US.UTF-8"
export CLICOLOR=1


# Start i3
if [[ -z "$DISPLAY" ]] && [[ "$XDG_VTNR" = 1 ]];then
  startx
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


# Load custom bash functions
if [[ -f "$HOME/.bash_functions" ]]; then
    . "$HOME/.bash_functions"
fi


# Load Custom exports and paths
if [[ -d "$HOME/.exports" ]]; then
	for file in "$HOME/.exports/"*; do
		if [[ -f "$file" ]]; then
			. "$file"     
		fi
	done 
fi


# Display Fast Fetch
if command -v fastfetch &>/dev/null; then
	# Load Fast Fetch with logo
	fastfetch --my-config
else
	echo -e "Fastfetch is not available."
fi


