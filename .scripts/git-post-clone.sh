#!/bin/bash
# ~/.dotfiles/.scripts/git-post-clone.sh

# Set the template directory path
TEMPLATE_DIR=~/git-templates/handel/hooks

# Check if the current directory is a Git repository
if [ -d ".git" ]; then
    # Copy the hooks from the template directory
    cp -r $TEMPLATE_DIR/* .git/hooks/
    echo "Git hooks applied from template directory."
else
    echo "Not a Git repository."
fi
