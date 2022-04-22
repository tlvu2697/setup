#!/bin/bash

sudo apt update

echo "[*] Installing system utils..."
sudo apt install -y gnome-tweaks xclip exuberant-ctags build-essential wget curl git font-manager ripgrep tmux mlocate imwheel

echo "[*] Python dependencies..."
sudo apt install -y make libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

echo "[*] Postgres dependencies..."
sudo apt install -y libpq-dev

echo "[*] Wireguard dependencies..."
sudo apt install -y openresolv

echo "[*] Init SSH key"
ssh-keygen -t rsa -b 4096 -C "tlvu2697@gmail.com"

echo "[*] Installing ibus..."
sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo
sudo apt-get update
sudo apt-get install ibus-bamboo
env DCONF_PROFILE=ibus dconf write /desktop/ibus/general/preload-engines "['BambooUs', 'Bamboo']" && gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'Bamboo')]"
ibus restart
echo "Please logout and login again"
