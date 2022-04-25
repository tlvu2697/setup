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

echo "[*] Installing hub..."
sudo apt install hub

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
asdf install python 2.7.18
asdf install python 3.4.10
asdf global python 3.4.10 2.7.18
sudo ln -s ~/.asdf/shims/python3 ~/.local/bin/_python3.6
sudo ln -s ~/.asdf/shims/python2 ~/.local/bin/_python2.7

echo "[*] Installing Ruby..."
asdf install ruby 3.0.2
asdf global ruby 3.0.2

echo "[*] Installing Neovim..."
sudo apt-get install -y neovim
git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
pip2 install neovim
pip3 install neovim
npm install -g neovim
gem install neovim
sudo ln -s ~/.asdf/shims/neovim-ruby-host ~/.local/bin/_neovim-ruby-host

echo "[*] Installing Tmuxinator..."
gem install tmuxinator
sudo ln -s ~/.asdf/installs/ruby/3.0.2/bin/tmuxinator ~/.local/bin/muxinator

echo "[*] Installing LazyGit..."
MY_FLAVOR=Linux_x86_64; curl -s -L $(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep -i "$MY_FLAVOR") | sudo tar xzf - -C ~/.local/bin lazygit

echo "[*] Installing LazyDocker..."
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

echo "[*] Redis Installation"
echo "https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-redis-on-ubuntu-20-04"

echo "[*] PostgresSQL Installation"
echo "https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04"

echo "[*] Docker Installation"
echo "https://docs.docker.com/engine/install/ubuntu/"


# DEPRECATED
echo "[*] Installing Git Cola"
git clone git://github.com/git-cola/git-cola.git ~/.git-cola
pip install pyqt5
sudo ln -s ~/.git-cola/bin/git-dag /usr/local/bin/git-dag
sudo ln -s ~/.git-cola/bin/git-cola /usr/local/bin/git-cola
