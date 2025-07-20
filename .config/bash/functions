#!/usr/bin/env bash
git() {
	if [[ "$1" == "clone" ]]; then
		command git clone "${@:2}"
		echo " Apply git hooks "
	else
		command git "$@"
	fi
};


cd() {
	if [[ "$1" == //* ]]; then
		command cd ..
	else
		command cd "$@";
	fi
};

stow() {
	if [[ "$(pwd)" != "$HOME/.dotfiles" ]]; then
		echo -e "\033[33m Stow was blocked to prevent creating misplaced symlinks  "
	else
		command stow "$@"
		bash "$HOME/.scripts/git/generate-git-config.sh"
	fi
};


git-submodule-update() {
	git submodule update --remote --merge
};

echo() {
	if [[ "$#" -eq 1 ]] && [[ "${1:-}" = "$PATH" ]]; then
		command echo "$PATH" | tr ':' '\n'
	else
		command echo "$@"
	fi
}

copy-branch() {
	git rev-parse --abbrev-ref HEAD | copy
};

unzip() {
	[[ -z "$1" ]] && { echo "Usage: unzip <file.zip>"; return 1; }
	local dirname="${1%.zip}"
	dirname="${dirname// /-}"
	command unzip "$1" -d "$dirname"
};

