#!/bin/bash

echo "[*] Setup gitignore_global"
git config --global core.excludesfile ~/.gitignore_global

echo "[*] Installing Homebrew..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >> ~/.bash_profile

echo "[*] Installing hub"
brew install hub

echo "[*] Installing ASDF..."
brew install asdf
echo -e "\n. $(brew --prefix asdf)/asdf.sh" >> ~/.zshrc
echo -e "\n. $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash" >> ~/.zshrc

echo "[*] Installing Chezmoi..."
brew install chezmoi
chezmoi init git@github.com:tlvu2697/dotfiles.git

echo "[*] Install Nodejs..."
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs 12.16.3
asdf global nodejs 12.16.3

echo "[*] Installing Python..."
asdf plugin-add python
asdf install python 2.7.13
asdf install python 3.6.2
asdf global python 3.6.2 2.7.13
sudo ln -s ~/.asdf/shims/python3 /usr/local/bin/python3.6
sudo ln -s ~/.asdf/shims/python2 /usr/local/bin/python2.7

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
