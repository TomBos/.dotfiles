#!/usr/bin/env bash
REPO_URL="$1"
CUSTOM_DIR="$2"

# Strip trailing slashes from URL
REPO_URL="${REPO_URL%/}"

if [[ -n "$CUSTOM_DIR" ]]; then
  TARGET_DIR="$CUSTOM_DIR"
else
  TARGET_DIR="$(basename "$REPO_URL" .git)"
fi

echo "$TARGET_DIR"

