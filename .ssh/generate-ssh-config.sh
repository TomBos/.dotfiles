#!/usr/bin/env bash

shopt -s nullglob
set -e

echo "(split hosts by comas, without spaces)"
read -rp "Which platforms do you want to connect to? (github.com,gitlab.com): " hosts
IFS=',' read -ra platforms <<< "$hosts"


for key_file in "$HOME/.ssh/"*.pub; do
	read -r algorithm sshkey email < "$key_file"

	shortkey="${sshkey:0:4}...${sshkey: -4}"

	echo "Found SSH key for $email, key was created using the $algorithm algorithm. ($shortkey)"
	for i in "${!platforms[@]}"; do
		echo "$i -> ${platforms[$i]}"
	done;

	read -rp "Select platform for this key: " platform_index

	if ! [[ "$platform_index" =~ ^[0-9]+$ ]] || (( platform_index < 0 )) || (( platform_index >= ${#platforms[@]} )); then
		echo "Invalid platform index"
		exit 1
	fi

	platform="${platforms[$platform_index]}"

	echo "$platform $key_file" >> "platforms.tmp"
done;

last_platform=""

sort platforms.tmp | while read -r platform key_file; do
    if [[ "$platform" != "$last_platform" ]]; then
        cat <<EOF >> config
Host $platform
    User git
    Hostname $platform
    IdentitiesOnly yes

EOF
    fi
	last_platform="$platform"

	cat << EOF >> config
Match host $platform exec "test -f $key_file"
	IdentityFile $key_file

EOF

done

rm "platforms.tmp"
