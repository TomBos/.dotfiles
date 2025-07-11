GITDIR="$HOME/Projects"

mkdir -p $HOME/{.config/git,Projects}

cat > $HOME/.config/git/config <<EOF
[user]
    name = Tomáš Bosák
    email = tombos255@gmail.com

[core]
    editor = vim

[includeIf "gitdir:${GITDIR}/handel/"]
    path = $HOME/.config/git/handel.gitconfig

[includeIf "gitdir:${GITDIR}/github/"]
    path = $HOME/.config/git/github.gitconfig

[alias]
    exclude = "!f() { for f in \"\$@\"; do echo \"\$f\" >> .git/info/exclude; done; }; f"

EOF

