gitclone() {
    git clone "$1"
    cd "$(basename "$1" .git)"
    ~/.scripts/git-post-clone.sh
}
