#!/usr/bin/env bash

# =====================
# Package checker script
# =====================

# Official repo packages
official_pkgs=(
	ttf-nerd-fonts-symbols
	swww
	ripgrep
	unzip
	git
	kitty
	stow
	imagemagick
	bash-completion
	php
	filezilla
	hyprland
	tree
	neovim
)

# AUR/foreign packages
aur_pkgs=(
	ttf-poppins
	librewolf-bin
)

# --- FUNCTIONS ---

colored_echo() {
	local text="$1"
	local color="$2"

	# Split the color encoding into three lines for readability
	echo -ne "\e[${color}m"
	echo -e "$text"
	echo -ne "\e[0m"

}

check_pkgs() {
	local type="$1"
	local pkgs=("${@:2}")
	local all_installed=1

	for pkg in "${pkgs[@]}"; do
		if [[ "$type" == "official" ]]; then
			if ! pacman -Qn "$pkg" &>/dev/null; then
				colored_echo "$pkg is not installed !" "$RED"
				all_installed=0
			fi
		elif [[ "$type" == "aur" ]]; then
			if ! pacman -Qm "$pkg" &>/dev/null; then
				colored_echo "$pkg (AUR) is not installed !" "$RED"
				all_installed=0
			fi
		fi
	done

	return $all_installed
}

# --- GLOBAL ---
RED=31
GREEN=32

# --- MAIN ---

echo "== Checking official packages =="
check_pkgs "official" "${official_pkgs[@]}"
official_status=$?

if [[ "$official_status" == 1 ]]; then
	colored_echo "All official packages are installed" "$GREEN"
fi

echo "== Checking AUR packages =="

# Make sure paru itself exists (as foreign package)
if ! pacman -Q paru &>/dev/null; then
	echo "paru is not installed – install it before continuing"
	exit 2
fi

check_pkgs "aur" "${aur_pkgs[@]}"
aur_status=$?

if [[ "$aur_status" == 1 ]]; then
	colored_echo "All AUR packages are installed" "$GREEN"
fi

echo

# --- COMPILED PACKAGES ---

# git clone https://aur.archlinux.org/nerd-fonts-jetbrains-mono.git
# cd nerd-fonts-jetbrains-mono
# makepkg -si

# paru

