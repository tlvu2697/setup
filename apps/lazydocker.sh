#!/bin/bash

# allow specifying different destination directory
DIR="${DIR:-"$HOME/.local/bin"}"

# map different architecture variations to the available binaries
ARCH=$(uname -m)
case $ARCH in
    i386|i686) ARCH=x86 ;;
    armv6*) ARCH=armv6 ;;
    armv7*) ARCH=armv7 ;;
    aarch64*) ARCH=arm64 ;;
esac

# prepare the download URL
CURRENT_VERSION="v$(lazydocker --version | head -n 1 | sed -e 's/.*Version: \([^"]*\).*/\1/')"
GITHUB_LATEST_VERSION=$(curl -sL -H 'Accept: application/json' https://github.com/jesseduffield/lazydocker/releases/latest | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
GITHUB_FILE="lazydocker_${GITHUB_LATEST_VERSION//v/}_$(uname -s)_${ARCH}.tar.gz"
GITHUB_URL="https://github.com/jesseduffield/lazydocker/releases/download/${GITHUB_LATEST_VERSION}/${GITHUB_FILE}"

# install/update the local binary
if [ $CURRENT_VERSION != $GITHUB_LATEST_VERSION ]
then
  mkdir tmp
  curl -sL -o tmp/lazydocker.tar.gz $GITHUB_URL
  tar xzvf tmp/lazydocker.tar.gz -C tmp lazydocker > /dev/null
  install -Dm 755 tmp/lazydocker -t "$DIR"
  echo "[*] lazydocker (${CURRENT_VERSION} -> ${GITHUB_LATEST_VERSION})"
  rm -rf tmp
else
  echo "[-] lazydocker (${CURRENT_VERSION} - latest)"
fi
