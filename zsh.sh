#!/bin/bash

echo "[*] Installing Zsh..."
sudo apt-get install -y zsh

echo "[*] Installing Oh-My-Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
