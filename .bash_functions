git() {
    if [ "$1" == "clone" ]; then
        command git clone "$2"
        cd "$(basename "$2" .git)"
        ~/.scripts/git-post-clone.sh
    else
        command git "$@"
    fi
};

vim() {
    command nvim "$@"
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
    echo -e "\033[31mWARNING! Stow blocked to prevent creating misplaced symlinks!\033[0m"
  else
    command stow "$@"
  fi
}

