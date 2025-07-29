for pkg in \
ttf-poppins \
ttf-nerd-fonts-symbols \
swww \
ripgrep \
unzip \
librewolf-bin \
git \
paru \
kitty \
stow \
imagemagick \
bash-completion \
php \
filezilla \
hyprland \
tree \
noto-fonts-cjk \
noto-fonts-emoji \
neovim; do

  if ! pacman -Qi "$pkg" &>/dev/null; then
    echo "📦 Installing $pkg..."
    paru -S --noconfirm "$pkg"
  else
    echo "✅ $pkg is already installed."
  fi

done

