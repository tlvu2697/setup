#!/bin/bash
# https://github.com/fullstorydev/grpcurl

# allow specifying different destination directory
DIR="${DIR:-"$HOME/.local/bin"}"

# map different architecture variations to the available binaries
ARCH=$(uname -m)
case $ARCH in
    i386|i686) ARCH=x86_32 ;;
    aarch64*) ARCH=arm64 ;;
esac

# prepare the download URL
if ! command -v grpcurl &> /dev/null
then
  CURRENT_VERSION="none"
else
  CURRENT_VERSION="$(grpcurl --version 2>&1 | sed -e 's/.*grpcurl \([^"]*\)/\1/')"
fi
GITHUB_LATEST_VERSION=$(curl -sL -H 'Accept: application/json' https://github.com/fullstorydev/grpcurl/releases/latest | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
GITHUB_FILE="grpcurl_${GITHUB_LATEST_VERSION//v/}_$(uname -s | sed -e 's/\(.*\)/\L\1/')_${ARCH}.tar.gz"
GITHUB_URL="https://github.com/fullstorydev/grpcurl/releases/download/${GITHUB_LATEST_VERSION}/${GITHUB_FILE}"

# install/update the local binary
if [ $CURRENT_VERSION != $GITHUB_LATEST_VERSION ]
then
  mkdir tmp
  curl -sL -o tmp/grpcurl.tar.gz $GITHUB_URL
  tar xzvf tmp/grpcurl.tar.gz -C tmp grpcurl > /dev/null
  install -Dm 755 tmp/grpcurl -t "$DIR"
  echo "[*] grpcurl (${CURRENT_VERSION} -> ${GITHUB_LATEST_VERSION})"
  rm -rf tmp
else
  echo "[-] grpcurl (${CURRENT_VERSION} - latest)"
fi
