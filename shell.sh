#!/bin/bash

echo "[*] Installing Zsh..."
sudo apt-get install -y zsh
sudo chsh -s $(which zsh)


echo "[*] Installing OhMyZsh"

echo "[*] Installing OhMyZsh Plugins"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "[*] Install fzf..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
