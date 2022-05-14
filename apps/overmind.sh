#!/bin/bash

# allow specifying different destination directory
DIR="${DIR:-"$HOME/.local/bin"}"

# map different architecture variations to the available binaries
ARCH=$(uname -m)
case $ARCH in
    i386|i686) ARCH=386 ;;
    x86_64*) ARCH=amd64 ;;
    aarch64*) ARCH=arm64 ;;
esac

# prepare the download URL
GITHUB_LATEST_VERSION=$(curl -L -s -H 'Accept: application/json' https://github.com/DarthSim/overmind/releases/latest | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
GITHUB_FILE="overmind-${GITHUB_LATEST_VERSION}-$(uname -s | sed -e 's/\(.*\)/\L\1/')-${ARCH}.gz"
GITHUB_URL="https://github.com/DarthSim/overmind/releases/download/${GITHUB_LATEST_VERSION}/${GITHUB_FILE}"

# install/update the local binary
echo $GITHUB_LATEST_VERSION
mkdir tmp
curl -L -o tmp/overmind.gz $GITHUB_URL
gunzip tmp/overmind.gz
install -Dm 755 tmp/overmind -t "$DIR"
rm -rf tmp
