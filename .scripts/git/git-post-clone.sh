#!/usr/bin/env bash
set -e

REPO_URL="$1"
CUSTOM_DIR="$2"
PROJECTS_DIR=${PROJECTS:-$HOME/src}

# Determine the intended clone directory
if [[ -n "$CUSTOM_DIR" ]]; then
  CLONE_DIR="$PWD/$CUSTOM_DIR"
else
  CLONE_DIR="$PWD/$(basename "${REPO_URL%/}" .git)"
fi


# Clone into the resolved directory
command git clone "$REPO_URL" "$CLONE_DIR"


if [[ "$CLONE_DIR" == "$PROJECTS_DIR/handel/"* ]]; then
	# Set the template directory path
	TEMPLATE_DIR="$HOME/git-templates/handel/hooks"
	TARGET_DIR="$CLONE_DIR/.git/hooks"

	# Remove samples
	rm -f "$TARGET_DIR/"*.sample

	# Copy template
	cp -r "$TEMPLATE_DIR/"* "$TARGET_DIR/"
fi

# stdout
echo "$CLONE_DIR"

