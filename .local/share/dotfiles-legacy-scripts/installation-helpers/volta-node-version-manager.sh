#!/usr/bin/env bash

echo "I do not use this anymore, please use PNPM or NVM for best experience."
read -rp "Do you still want to install Volta? [Y/n]: " answer

answer=${answer,,}

if [[ "$answer" == "n" || "$answer" == "no" ]]; then
  echo "Installation aborted."
  exit 0
fi

echo "Installing Volta..."
curl https://get.volta.sh | bash

