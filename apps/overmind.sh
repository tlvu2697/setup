#!/bin/bash
# https://github.com/DarthSim/overmind

# allow specifying different destination directory
DIR="${DIR:-"$HOME/.local/bin"}"

# map different architecture variations to the available binaries
ARCH=$(uname -m)
case $ARCH in
    x86_64*) ARCH=amd64 ;;
esac

# prepare the download URL
if ! command -v overmind &> /dev/null
then
  CURRENT_VERSION="none"
else
  CURRENT_VERSION="v$(overmind -v | sed -e 's/.*version \([^"]*\).*/\1/')"
fi
GITHUB_LATEST_VERSION=$(curl -sL -H 'Accept: application/json' https://github.com/DarthSim/overmind/releases/latest | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
GITHUB_FILE="overmind-${GITHUB_LATEST_VERSION}-$(uname -s | sed -e 's/\(.*\)/\L\1/')-${ARCH}.gz"
GITHUB_URL="https://github.com/DarthSim/overmind/releases/download/${GITHUB_LATEST_VERSION}/${GITHUB_FILE}"

# install/update the local binary
if [ $CURRENT_VERSION != $GITHUB_LATEST_VERSION ]
then
  mkdir tmp
  curl -sL -o tmp/overmind.gz $GITHUB_URL
  gunzip tmp/overmind.gz
  install -Dm 755 tmp/overmind -t "$DIR"
  echo "[*] overmind (${CURRENT_VERSION} -> ${GITHUB_LATEST_VERSION})"
  rm -rf tmp
else
  echo "[-] overmind (${CURRENT_VERSION} - latest)"
fi
