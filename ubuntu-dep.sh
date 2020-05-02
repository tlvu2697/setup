#!/bin/bash

echo "[*] Installing system utils..."
sudo apt-get install -y gnome-tweaks gnome-panel ppa-purge xclip ctags file make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git font-manager ripgrep

echo "[*] Init SSH key"
ssh-keygen -t rsa -b 4096 -C "tlvu2697@gmail.com"

echo "[*] Update persmission on /usr/local/bin"
sudo chown -R $(whoami) /usr/local/bin

echo "[*] Installing ibus..."
sudo apt install ibus
im-config -n ibus
sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo
sudo apt-get update
sudo apt-get install ibus-bamboo
ibus restart
echo "Please logout and login again"
