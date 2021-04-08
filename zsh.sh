#!/bin/bash

echo "[*] Installing Zsh..."
sudo apt-get install -y zsh
chsh -s /bin/zsh

echo "[*] Installing Prezto..."
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
