#!/usr/bin/env bash
git() {
	if [[ "$1" == "clone" ]]; then
		command git clone "${@:2}"
		echo "	 Apply git hooks  "
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


fastfetch() {
	if [[ "$1" == "--my-config" ]]; then
		local height=20
		local width=50
		local pd_top=3
		local pd_left=3

		command fastfetch \
		--logo "$FASTFETCH_LOGO_PATH" \
		--logo-height "$height" \
		--logo-width "$width" \
		--logo-padding-top "$pd_top" \
		--logo-padding-left "$pd_left"
	else
		command fastfetch "$@"
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
	command unzip "$1" -d ${1/.zip/}
};

