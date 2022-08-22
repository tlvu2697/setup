#!/bin/bash

sudo apt update

echo "[*] Installing system utils..."
sudo apt install -y gnome-tweaks xclip exuberant-ctags build-essential wget curl git font-manager ripgrep tmux mlocate imwheel fzf fd-find baobab
ln -s $(which fdfind) $HOME/.local/bin/fd

echo "[*] Ruby dependencies..."
sudo apt install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev

echo "[*] Python dependencies..."
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

echo "[*] Postgres dependencies..."
sudo apt install -y libpq-dev

echo "[*] Wireguard dependencies..."
sudo apt install -y openresolv

echo "[*] Init SSH key"
ssh-keygen -t ed25519 -C "tlvu2697@gmail.com"

echo "[*] Installing ibus..."
sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo
sudo apt-get update
sudo apt-get install ibus-bamboo
env DCONF_PROFILE=ibus dconf write /desktop/ibus/general/preload-engines "['BambooUs', 'Bamboo']" && gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'Bamboo')]"
ibus restart
echo "Please logout and login again"

echo "[*] Install applications from snapcraft..."
sudo snap install beekeeper-studio mailspring notion-snap postman slack spotify telegram-desktop
