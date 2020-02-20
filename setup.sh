#!/bin/bash

echo "[*] Installing Telegram..."
wget "https://telegram.org/dl/desktop/linux" -O tsetup.tar.xz
sudo tar xf tsetup.tar.xz -C /opt/
rm -rf tsetup.tar.xz
nautilus /opt/Telegram/
echo "*************************************************************"
echo "*                                                           *"
echo "*  Exec=env QT_IM_MODULE=ibus /opt/Telegram/Telegram -- %u  *"
echo "*                                                           *"
echo "*************************************************************"
nautilus ~/.local/share/applications/

echo "[*] Installing system utils..."
sudo apt-get install -y gnome-panel ppa-purge xclip ctags file make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
ssh-keygen -t rsa -b 4096 -C "tlvu2697@gmail.com"

echo "[*] Installing ibus..."
sudo add-apt-repository -y ppa:ubuntu-vn/ppa
sudo apt-get update
sudo apt-get install -y ibus-unikey
ibus restart

echo "[*] Installing Thunderbird..."
sudo add-apt-repository -y ppa:ubuntu-mozilla-security/ppa
sudo apt-get update
sudo apt-get install -y thunderbird

echo "[*] Installing Firefox Developer Edition..."
wget "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US" -O firefox-dev.tar.bz2
sudo tar xjf firefox-dev.tar.bz2 -C /opt/
rm -rf firefox-dev.tar.bz2
cat > ~/.local/share/applications/FirefoxDeveloperEdition.desktop <<EOL
#!/usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Icon[en_US]=/opt/firefox/browser/chrome/icons/default/default128.png
Name[en_US]=Firefox Developer Edition
Exec=/opt/firefox/firefox
Name=Firefox Developer Edition
Icon=/opt/firefox/browser/chrome/icons/default/default128.png
EOL


echo "[*] Installing Zsh..."
sudo apt-get install -y zsh

echo "[*] Installing Oh-My-Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "[*] Installing Homebrew..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

echo "[*] Installing hub"
brew install hub

echo "[*] Installing ASDF..."
brew install asdf

echo "[*] Installing Chezmoi..."
brew install twpayne/taps/chezmoi

echo "[*] Install Nodejs..."
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs 10.15.0
asdf global nodejs 10.15.0

echo "[*] Install Python..."
asdf plugin-add python
asdf install python 2.7.13
asdf install python 3.6.2
asdf global python 3.6.2 2.7.13
sudo ln -s /home/tlvu/.asdf/shims/python3 /usr/local/bin/python3
sudo ln -s /home/tlvu/.asdf/shims/python2 /usr/local/bin/python2.7

echo "[*] Installing Neovim..."
sudo apt-get install -y neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "[*] Installing Tmux..."
sudo apt-get install -y tmux

echo "[*] Installing Tmuxinator..."
brew install tmuxinator
