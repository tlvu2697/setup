#!/bin/sh

echo "[*] Cloning dotfiles"
cd ~/workspace/tlvu2697
git clone git@github.com:tlvu2697/dotfiles.git
bash link.sh

echo "[*] Cloning nvim config"
cd ~/workspace/tlvu2697
git clone git@github.com:tlvu2697/nvim.git
bash link.sh

echo "[*] Setup gitignore_global..."
git config --global core.excludesfile ~/.gitignore_global

echo "[*] Installing Github CLI / Neovim / LazyGit / LazyDocker / Overmind / Redis..."
brew install gh neovim lazygit lazydocker overmind overmind redis

echo "[*] Installing ASDF..."
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf plugin-add python
asdf plugin-add ruby

echo "[*] Install Nodejs..."
asdf install nodejs 16.14.2
asdf global nodejs 16.14.2

echo "[*] Installing Python..."
asdf install python 3.10.5
asdf global python 3.10.5
sudo ln -s ~/.asdf/shims/python3 /usr/local/bin/_python3

echo "[*] Installing Ruby..."
asdf install ruby 3.1.2
asdf global ruby 3.1.2

echo "[*] Configuring Neovim..."
git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
pip3 install neovim
npm install -g neovim
gem install neovim

echo "[*] Installing Tmuxinator..."
gem install tmuxinator
sudo ln -s ~/.asdf/installs/ruby/3.1.2/bin/tmuxinator ~/.local/bin/muxinator

echo "[*] Installing Alacritty..."
brew install --cask alacritty
