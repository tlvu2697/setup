#!/bin/bash

echo "[*] Init SSH key"
ssh-keygen -t ed25519 -C "tlvu2697@gmail.com"

echo "[*] Installing system utils..."
brew install xclip ctags wget curl git ripgrep tmux fzf fd

echo "[*] Installing apps..."
brew install --cask beekeeper-studio mailspring notion postman slack spotify telegram
