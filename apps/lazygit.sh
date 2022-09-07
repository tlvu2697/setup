#!/bin/bash
# https://github.com/jesseduffield/lazygit

# MY_FLAVOR=Linux_x86_64; curl -s -L $(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep -i "$MY_FLAVOR") | sudo tar xzf - -C ~/.local/bin lazygit

# allow specifying different destination directory
DIR="${DIR:-"$HOME/.local/bin"}"

# map different architecture variations to the available binaries
ARCH=$(uname -m)
case $ARCH in
    x86_64*) ARCH=x86_64 ;;
esac

# prepare the download URL
if ! command -v lazygit &> /dev/null
then
  CURRENT_VERSION="none"
else
  CURRENT_VERSION="v$(lazygit -v | sed -e 's/.*version=\([^"]*\), os.*/\1/')"
fi
GITHUB_LATEST_VERSION=$(curl -sL -H 'Accept: application/json' https://github.com/jesseduffield/lazygit/releases/latest | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
GITHUB_FILE="lazygit_${GITHUB_LATEST_VERSION//v/}_$(uname -s)_${ARCH}.tar.gz"
GITHUB_URL="https://github.com/jesseduffield/lazygit/releases/download/${GITHUB_LATEST_VERSION}/${GITHUB_FILE}"

# install/update the local binary
if [ $CURRENT_VERSION != $GITHUB_LATEST_VERSION ]
then
  mkdir tmp
  curl -sL -o tmp/lazygit.tar.gz $GITHUB_URL
  tar xzvf tmp/lazygit.tar.gz -C tmp lazygit > /dev/null
  install -Dm 755 tmp/lazygit -t "$DIR"
  echo "[*] lazygit (${CURRENT_VERSION} -> ${GITHUB_LATEST_VERSION})"
  rm -rf tmp
else
  echo "[-] lazygit (${CURRENT_VERSION} - latest)"
fi
