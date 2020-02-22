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
