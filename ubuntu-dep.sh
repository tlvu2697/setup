#!/bin/bash

echo "[*] Installing system utils..."
sudo apt-get install -y gnome-tweaks gnome-panel ppa-purge xclip ctags file make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git font-manager
ssh-keygen -t rsa -b 4096 -C "tlvu2697@gmail.com"

echo "[*] Installing ibus..."
sudo add-apt-repository -y ppa:ubuntu-vn/ppa
sudo apt-get update
sudo apt-get install -y ibus-unikey
ibus restart
