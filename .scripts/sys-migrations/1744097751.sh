#!/usr/bin/env bash
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm --needed filezilla \
  xclip \
  ruby \
  bash-completion 
    
  
  
gem install neovim
gem install environment

gem environment | awk '/USER/ {print $5}'
