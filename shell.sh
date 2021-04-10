#!/bin/bash

echo "[*] Installing Zsh..."
sudo apt-get install -y zsh
chsh -s /bin/zsh

echo "[*] Installing zinit..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

echo "[*] Install fzf..."
sudo apt-get install fzf
