# Only interactive use
[[ $- == *i* ]] || return

# Load Custom exports and paths
if [[ -d "$HOME/.exports" ]]; then
	for file in "$HOME/.exports/"*; do
		if [[ -f "$file" ]]; then
			source "$file"
		fi
	done
fi


source "$XDG_CONFIG_HOME/bash/bashrc"
