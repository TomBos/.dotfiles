#!/bin/bash

snap list --all | awk 'NR>1 {print $1}' | xargs -n1 sudo snap remove --purge

sudo apt remove --autoremove snapd -y

echo -e 'Package: snapd\nPin: release o=Ubuntu\nPin-Priority: -1' | sudo tee /etc/apt/preferences.d/no-snap

sudo rm -rf /var/snap /snap /var/lib/snapd /var/cache/snapd ~/snap

echo "Snap has been completely removed."
