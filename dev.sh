#!/bin/bash

echo "[*] Setup gitignore_global"
git config --global core.excludesfile ~/.gitignore_global

echo "[*] Installing hub"
sudo snap install hub --classic

echo "[*] Installing ASDF..."
git clone https://github.com/asdf-vm/asdf.git ~/.asdf

echo "[*] Installing Chezmoi..."
sudo snap install chezmoi --classic
chezmoi init git@github.com:tlvu2697/dotfiles.git

echo "[*] Install Nodejs..."
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs 12.18.3
asdf global nodejs 12.18.3

echo "[*] Installing Python..."
asdf plugin-add python
asdf install python 2.7.13
asdf install python 3.6.2
asdf global python 3.6.2 2.7.13
sudo ln -s ~/.asdf/shims/python3 /usr/local/bin/_python3.6
sudo ln -s ~/.asdf/shims/python2 /usr/local/bin/_python2.7

echo "[*] Installing Ruby..."
asdf plugin-add ruby
asdf install ruby 2.7.1
asdf global ruby 2.7.1

echo "[*] Installing Neovim..."
sudo apt-get install -y neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip2 install neovim
pip3 install neovim
npm install -g neovim
gem install neovim

echo "[*] Installing Tmuxinator..."
gem install tmuxinator
sudo ln -s ~/.asdf/installs/ruby/2.7.1/bin/tmuxinator /usr/local/bin/muxinator

echo "[*] Installing Git Cola"
git clone git://github.com/git-cola/git-cola.git ~/.git-cola
pip install pyqt5
sudo ln -s ~/.git-cola/bin/git-dag /usr/local/bin/git-dag
sudo ln -s ~/.git-cola/bin/git-cola /usr/local/bin/git-cola
