#!/bin/bash

# Set the template directory path
TEMPLATE_DIR=~/git-templates/handel/hooks

# Get the current directory
CURRENT_DIR=$(pwd)


if [[ "$CURRENT_DIR" == /var/www/html/handel/* ]] && [ -d ".git" ]; then
	cp -r $TEMPLATE_DIR/* .git/hooks/
	echo "Git hooks applied from template directory."
fi
