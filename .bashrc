# Only interactive use
[[ $- == *i* ]] || return

load_bashrc() {
	local bash_config="$HOME/.config/bash/bashrc"
	source "$bash_config"
};

load_bashrc
