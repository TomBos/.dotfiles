#!/bin/bash
sudo add-apt-repository ppa:mozillateam/ppa -y
sudo apt update
echo 'Package: *\nPin: release o=LP-PPA-mozillateam\nPin-Priority: 1001' | sudo tee /etc/apt/preferences.d/mozilla-firefox  
sudo apt install firefox -y
