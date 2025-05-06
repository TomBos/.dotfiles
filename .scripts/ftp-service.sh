#!/usr/bin/env bash

LOCAL_DIR=/var/www/html/handel/presta-eshopy
REMOTE_DIR=/mnt/ftp-server/htdocs

inotifywait -mrq -e close_write --format "%w%f" "$LOCAL_DIR" | while read file; do
    case "$file" in
        *4913|*.swp|*.swo|*.tmp|*.lock|*/.git/*) continue ;;
    esac

    # Make target path match local structure
    rel_path="${file#$LOCAL_DIR/}"
    dest_path="$REMOTE_DIR/$rel_path"

    # Copy the file
    cp -f "$file" "$dest_path" && echo "✅ Synced: $rel_path"
done

