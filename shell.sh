#!/bin/sh

echo "[*] Installing Zsh..."
sudo apt-get install -y zsh
sudo chsh -s $(which zsh)

echo "[*] Installing OhMyZsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "[*] Installing OhMyZsh Plugins"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "[*] Install fzf..."
sudo apt install -y fzf
apt-cache show fzf
