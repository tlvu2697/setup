echo "[*] Change swap size to 32GB (https://bogdancornianu.com/change-swap-size-in-ubuntu/)"
sudo swapoff -a
sudo dd if=/dev/zero of=/swapfile bs=1G count=32
sudo mkswap /swapfile
sudo swapon /swapfile
grep SwapTotal /proc/meminfo

echo "[*] Tweak swap settings (https://www.digitalocean.com/community/tutorials/how-to-add-swap-space-on-ubuntu-16-04#tweak-your-swap-settings)"
sudo sh -c "echo vm.vfs_cache_pressure=50 >> /etc/sysctl.conf"
sudo sh -c "echo vm.swappiness=10 >> /etc/sysctl.conf"
sudo sysctl -p

echo "[*] Increase max_user_watches (https://github.com/guard/listen/blob/master/README.md#increasing-the-amount-of-inotify-watchers)"
sudo sh -c "echo fs.inotify.max_user_watches=1048576 >> /etc/sysctl.conf"
sudo sysctl -p

echo "[*] Deep sleep (https://askubuntu.com/questions/1029474/ubuntu-18-04-dell-xps13-9370-no-longer-suspends-on-lid-close)"
echo deep | sudo tee /sys/power/mem_sleep

echo "[*] Change battery levels' thresholds (https://askubuntu.com/questions/92794/how-to-change-critically-low-battery-value)"
gsettings set org.gnome.settings-daemon.plugins.power percentage-action 15
gsettings set org.gnome.settings-daemon.plugins.power percentage-critical 20
gsettings set org.gnome.settings-daemon.plugins.power percentage-low 30
gsettings set org.gnome.settings-daemon.plugins.power use-time-for-policy false

echo "[*] Stress test tools"
sudo apt install stress
sudo apt install hashcat
git clone https://github.com/wilicc/gpu-burn "$HOME/.gpu-burn"
sudo ln -s ~/.gpu-burn/gpu_burn /usr/local/bin/gpu-burn
