#!/usr/bin/env bash

shopt -s nullglob
set -e

read -rp "Which platforms do you want to connect to? (github.com, bitbucket.org): " hosts
IFS=',' read -ra raw_platforms <<< "$hosts"
platforms=()
last_platform=""

for p in "${raw_platforms[@]}"; do
    trimmed=$(echo "$p" | xargs)
    [[ -n "$trimmed" ]] && platforms+=("$trimmed")
done


for pub_key in "$HOME/.ssh/"*.pub; do
	priv_key=${pub_key/.pub/}
	
	if [[ ! -f $priv_key ]]; then
		continue;
	fi

	read -r algorithm sshkey email < "$pub_key"

	echo "Found SSH key for $email, key was created using the $algorithm algorithm. ($priv_key)"
	for i in "${!platforms[@]}"; do
		echo "$i -> ${platforms[$i]}"
	done;

	read -rp "Select platform for this key: " platform_index

	if ! [[ "$platform_index" =~ ^[0-9]+$ ]] || (( platform_index < 0 )) || (( platform_index >= ${#platforms[@]} )); then
		echo "Invalid platform index"
		exit 1
	fi

	platform="${platforms[$platform_index]}"

	echo "$platform $priv_key" >> "platforms.tmp"
done;


sort platforms.tmp | while read -r platform key_location; do
    
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
Match host $platform exec "test -f $key_location"
	IdentityFile $key_location

EOF

done

echo "New config was appended to $HOME/.ssh/config!"
rm "platforms.tmp"
