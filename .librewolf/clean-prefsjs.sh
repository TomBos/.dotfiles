#!/usr/bin/env bash
set -e

GREEN="\e[32m"
RED="\e[31m"
RESET="\e[0m"

dirs=()
for dir in *.*; do
	[[ -d $dir ]] && dirs+=("$dir")
done

for profile in "${dirs[@]}"; do
	echo ""
	echo -e "${GREEN}Checking profile: $profile${RESET}"
	
	duplicates=$(grep -Fxf user.js "$profile/prefs.js" || true)
	if [[ -n $duplicates ]]; then
		echo -e "${RED}Found duplicates in $profile:${RESET}"
		echo -e "${RED}${duplicates}${RESET}"
    	
		grep -Fvxf user.js "$profile/prefs.js" > "$profile/prefs.js.tmp"
		mv "$profile/prefs.js.tmp" "$profile/prefs.js"
		echo -e "${GREEN}Duplicates removed from $profile/prefs.js${RESET}"
	else
		echo -e "${GREEN}No duplicates found in $profile${RESET}"
	fi
	
	cp -f user.js "$profile/user.js"
	echo -e "${GREEN}Copied user.js to $profile${RESET}"
done

