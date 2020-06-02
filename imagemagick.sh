echo "[*] Setup pkg-config and imagemagick@7"
brew install pkg-config imagemagick

echo "[*] Link imagemagick"
brew link --force imagemagick

echo "[*] Create system symlink"
locate libMagickCore-7.Q16HDRI.so.7
sudo ln -s /home/linuxbrew/.linuxbrew/lib/libMagickCore-7.Q16HDRI.so.7 /usr/lib/x86_64-linux-gnu/libMagickCore-7.Q16HDRI.so.7
