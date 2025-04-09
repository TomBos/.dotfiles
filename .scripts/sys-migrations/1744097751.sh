#!/usr/bin/env bash
# Get Colors
source colors.sh

check_for_updates() {
  UPDATES=$(pacman -Qu)

  if [ -n "$UPDATES" ]; then
    echo "There are updates available:"
    echo "$UPDATES"
    sudo pacman -Syu --noconfirm
  else
    echo "Your pacman packages are already up-to-date."
  fi
}


update_or_install_pkg() {
  for pkg in "$@"; do
    LOCAL_V=$(pacman -Q "$pkg" 2>/dev/null | awk '{print $2}')

    COLORED_PKG="${YELLOW}$pkg${RESET}"

    if [ -z "$LOCAL_V" ]; then
      echo -e "$COLORED_PKG: not installed → remote $REMOTE_V"
      echo -e "installing $COLORED_PKG"
      sudo pacman -S --noconfirm --needed "$pkg"
    else
      echo -e "$COLORED_PKG: up-to-date ($LOCAL_V)"
    fi
  done
}


check_and_install_gems() {
  for gemfile in "$@"; do
    REMOTE_V=$(gem list -r -e "$gemfile" | grep -E "^$gemfile " | awk '{print $2}' | tr -d '()')
    LOCAL_V=$(gem list -e "$gemfile" | grep -E "^$gemfile " | awk '{print $2}' | tr -d '()')

    COLORED_GEM="${GREEN}$gemfile${RESET}"

    if [ "$REMOTE_V" != "$LOCAL_V" ]; then
      echo -e "$COLORED_GEM: local $LOCAL_V → remote $REMOTE_V"
      echo -e "updating $COLORED_GEM"
      gem install "$COLORED_GEM"
    else
      echo -e "$COLORED_GEM: up-to-date ($LOCAL_V)"
    fi
  done
}


# === MAIN SCRIPT ===
check_for_updates

echo -e "${BRIGHT_YELLOW}===PACMAN===${RESET}"
update_or_install_pkg filezilla xclip ruby bash-completion

echo -e "${BRIGHT_GREEN}===GEM===${RESET}"
check_and_install_gems neovim environment


if [[ -f "lockfile.lock" ]]; then
  source "lockfile.lock"
else
  # DO LATER!
  echo "Lockfile not found. Creating it now..."
fi

GEM_BIN="$(gem environment | awk '/USER INSTALLATION DIRECTORY/ {print $5}')/bin"
echo 'export PATH="'"$GEM_BIN"':$PATH"' > "$HOME/.exports/ruby.path"



