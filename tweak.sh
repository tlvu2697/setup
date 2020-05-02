echo "[*] Update persmission on /usr/local/bin"
sudo chown -R $(whoami) /usr/local/bin

echo "[*] Change swap size to 32GB (https://bogdancornianu.com/change-swap-size-in-ubuntu/)"
sudo swapoff -a
sudo dd if=/dev/zero of=/swapfile bs=1G count=32
sudo mkswap /swapfile
sudo swapon /swapfile
grep SwapTotal /proc/meminfo

echo "[*] Tweak swap settings (https://www.digitalocean.com/community/tutorials/how-to-add-swap-space-on-ubuntu-16-04#tweak-your-swap-settings)"
sudo sysctl vm.vfs_cache_pressure=50
sudo sysctl vm.swappiness=10

echo "[*] Increase max_user_watches (https://github.com/google/cadvisor/issues/1581)"
sudo sysctl fs.inotify.max_user_watches=1048576
