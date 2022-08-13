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

echo "[*] Installing Github CLI..."
sudo apt install gh

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
asdf install ruby 3.0.2
asdf global ruby 3.0.2

echo "[*] Installing Neovim..."
sudo apt-get install -y neovim
git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
pip3 install neovim
npm install -g neovim
gem install neovim
sudo ln -s ~/.asdf/shims/neovim-ruby-host /usr/bin/_neovim-ruby-host

echo "[*] Installing Tmuxinator..."
gem install tmuxinator
sudo ln -s ~/.asdf/installs/ruby/3.0.2/bin/tmuxinator ~/.local/bin/muxinator

echo "[*] Installing Alacritty..."
sudo add-apt-repository ppa:aslatter/ppa
sudo apt install -y alacritty

echo "[*] Installing LazyGit..."
curl https://raw.githubusercontent.com/tlvu2697/setup/master/apps/lazygit.sh | bash

echo "[*] Installing LazyDocker..."
curl https://raw.githubusercontent.com/tlvu2697/setup/master/apps/lazydocker.sh | bash

echo "[*] Installing Overmind..."
curl https://raw.githubusercontent.com/tlvu2697/setup/master/apps/overmind.sh | bash

echo "[*] Redis Installation"
echo "https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-redis-on-ubuntu-20-04"

echo "[*] PostgresSQL Installation"
echo "https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04"

echo "[*] Docker Installation"
echo "https://docs.docker.com/engine/install/ubuntu/"
