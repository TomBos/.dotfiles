#!/usr/bin/env bash
git() {
    if [ "$1" == "clone" ]; then
        command git clone "$2"
        cd "$(basename "$2" .git)"
        bash "$HOME/.scripts/git/git-post-clone.sh"
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
        command fastfetch --logo "$FAST_FETCH_LOGO_PATH" --logo-height 20 --logo-width 50 --logo-padding-top 3 --logo-padding-left 3
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
  git rev-parse --abbrev-ref HEAD | xclip -selection clipboard
};


