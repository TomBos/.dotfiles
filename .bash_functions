#!/usr/bin/env bash
git() {
	if [ "$1" == "clone" ]; then
		# Pass all args starting at 2nd
		bash -x "$HOME/.scripts/git/git-post-clone.sh" "${@:2}"
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
	if [ "$1" == "--my-config" ]; then
		local height=20
		local width=50
		local pd_top=3
		local pd_left=3

		command fastfetch \
		--logo "$FAST_FETCH_LOGO_PATH" \
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
	if [[ "$#" -eq 1 && "$1" == "$PATH" ]]; then
		command echo "$PATH" | tr ':' '\n'
	else
		command echo "$@"
	fi
};

copy-branch() {
	git rev-parse --abbrev-ref HEAD | copy
};

