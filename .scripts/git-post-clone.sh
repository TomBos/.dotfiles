#!/bin/bash

# Set the template directory path
TEMPLATE_DIR=~/git-templates/handel/hooks

# Get the current directory
CURRENT_DIR=$(pwd)


if [[ "$CURRENT_DIR" == /var/www/html/handel/* ]]; then
	# Remove samples
	rm -f "$CURRENT_DIR/.git/hooks"/*.sample

	# Copy template
	cp -r "$TEMPLATE_DIR"/* ".git/hooks/"

	# Confirmation message
	echo "Git hooks applied from template directory."
fi
