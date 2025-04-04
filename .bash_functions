git() {
    if [ "$1" == "clone" ]; then
        command git clone "$2"
        cd "$(basename "$2" .git)"
        ~/.dotfiles/scripts/git-post-clone.sh
    else
        command git "$@"
    fi
}
