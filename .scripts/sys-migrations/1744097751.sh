#!/usr/bin/env bash
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm --needed filezilla \
  xclip \
  ruby \
  bash-completion 
      
gem install neovim
gem install environment


if [[ -f "lockfile.lock" ]]; then
  source "lockfile.lock"
else
  # DO LATER!
  echo "Lockfile not found. Creating it now..."
fi

GEM_BIN="$(gem environment | awk '/USER INSTALLATION DIRECTORY/ {print $5}')/bin"
sed '/<ID:RUBY_PATH>/a export PATH="'"$GEM_BIN"':$PATH"' "$HOME/.bash_exports" > "$HOME/.bash_exports"



