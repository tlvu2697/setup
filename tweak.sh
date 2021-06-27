echo "[*] Update persmission on /usr/local/bin"
sudo chown -R $(whoami) /usr/local/bin

echo "[*] Update persmission on /var/log"
sudo chown -R $(whoami) /var/log

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

echo "[*] Deep sleep (https://askubuntu.com/questions/1029474/ubuntu-18-04-dell-xps13-9370-no-longer-suspends-on-lid-close)"
echo deep | sudo tee /sys/power/mem_sleep
