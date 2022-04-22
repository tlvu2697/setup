#!/bin/bash

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
