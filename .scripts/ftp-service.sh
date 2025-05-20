#!/usr/bin/env bash

LOCAL_DIR=/var/www/html/handel/presta-eshopy
REMOTE_DIR=/mnt/ftp-servers/chi/htdocs

inotifywait -mrq -e close_write --format "%w%f" "$LOCAL_DIR" | while read file; do
    case "$file" in
        *.swp|*.tmp|*.lock|*/.git/*|*.*~) continue ;;
    esac

    # Make target path match local structure
    rel_path="${file#$LOCAL_DIR/}"
    dest_path="$REMOTE_DIR/$rel_path"

    # Create dir if it doesnt exist
    dest_dir=$(dirname "$dest_path")

    if [ ! -d "$dest_dir" ]; then
        mkdir -p "$dest_dir"
    fi

    # Copy the file
    cp -f "$file" "$dest_path" && echo "✅ Synced: $rel_path"
done

