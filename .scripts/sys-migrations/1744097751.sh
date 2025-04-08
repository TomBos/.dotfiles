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
    echo "Your system is already up-to-date."
  fi
}


update_or_install_pkg() {
  for pkg in "$@"; do
    LOCAL_V=$(pacman -Q "$pkg" 2>/dev/null | awk '{print $2}')
    REMOTE_V=$(pacman -Si "$pkg" 2>/dev/null | awk '/^Version/ {print $3}')

    COLORED_PKG="${RED}$pkg${RESET}"

    if [ -z "$LOCAL_V" ]; then
      echo -e "$COLORED_PKG: not installed → remote $REMOTE_V"
      echo -e "installing $COLORED_PKG"
      sudo pacman -S --noconfirm --needed "$pkg"
    elif [ "$LOCAL_V" != "$REMOTE_V" ]; then
      echo -e "$COLORED_PKG: local $LOCAL_V → remote $REMOTE_V"
      echo -e "updating $COLORED_PKG"
      sudo pacman -S --noconfirm "$pkg"
    else
      echo -e "$COLORED_PKG: up-to-date ($LOCAL_V)"
    fi
  done
}


check_and_install_gems() {
  for gemfile in "$@"; do
    REMOTE_V=$(gem list -r -e "$gemfile" | grep -E "^$gemfile " | awk '{print $2}' | tr -d '()')
    LOCAL_V=$(gem list -e "$gemfile" | grep -E "^$gemfile " | awk '{print $2}' | tr -d '()')

    if [ "$REMOTE_V" != "$LOCAL_V" ]; then
      echo "$gemfile: local $LOCAL_V → remote $REMOTE_V"
      echo "updating $gemfile"
      gem install "$gemfile"
    else
      echo "$gemfile: up-to-date ($LOCAL_V)"
    fi
  done
}

check_for_updates
echo -e "${BRIGHT_YELLOW}===PACMAN===${RESET}"
update_or_install_pkg filezilla xclip ruby bash-completion
check_and_install_gems neovim environment


if [[ -f "lockfile.lock" ]]; then
  source "lockfile.lock"
else
  # DO LATER!
  echo "Lockfile not found. Creating it now..."
fi

GEM_BIN="$(gem environment | awk '/USER INSTALLATION DIRECTORY/ {print $5}')/bin"
echo 'export PATH="'"$GEM_BIN"':$PATH"' > "$HOME/.exports/ruby.path"



