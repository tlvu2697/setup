#!/bin/bash
# https://github.com/sharkdp/bat

# map different architecture variations to the available binaries
ARCH=$(uname -m)
case $ARCH in
    x86_64*) ARCH=amd64 ;;
esac

# prepare the download URL
if ! command -v bat &> /dev/null
then
  CURRENT_VERSION="none"
else
  CURRENT_VERSION="v$(bat --version | sed -e 's/.*bat \([^"]*\) (.*/\1/')"
fi

GITHUB_LATEST_VERSION=$(curl -sL -H 'Accept: application/json' https://github.com/sharkdp/bat/releases/latest | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
GITHUB_FILE="bat_${GITHUB_LATEST_VERSION//v/}_${ARCH}.deb"
GITHUB_URL="https://github.com/sharkdp/bat/releases/download/${GITHUB_LATEST_VERSION}/${GITHUB_FILE}"

# install/update the deb package
if [ $CURRENT_VERSION != $GITHUB_LATEST_VERSION ]
then
  mkdir tmp
  curl -sL -o tmp/bat.deb $GITHUB_URL
  sudo dpkg -i tmp/bat.deb
  echo "[*] bat (${CURRENT_VERSION} -> ${GITHUB_LATEST_VERSION})"
  rm -rf tmp
else
  echo "[-] bat (${CURRENT_VERSION} - latest)"
fi
