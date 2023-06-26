#!/bin/bash

SCRIPT_DIR=$(pwd)

echo "-------------------------------------------------"
echo "Update pacman mirrors"
echo "-------------------------------------------------"
sudo pacman-mirrors -g

# Add parallel downloading
sudo sed -i 's/^#Para/Para/' /etc/pacman.conf

echo "-------------------------------------------------"
echo "Update pacman"
echo "-------------------------------------------------"
sudo pacman -Suyu --noconfirm

echo "-------------------------------------------------"
echo "Uninstalling packages"
echo "-------------------------------------------------"
sudo pacman -Rscn --noconfirm - <packages/uninstall.txt

echo "-------------------------------------------------"
echo "Installing pacman packages"
echo "-------------------------------------------------"
sudo pacman -Sy --noconfirm git make gcc base-devel
sudo pacman -Sy --noconfirm - <packages/pkglist.txt

echo "-------------------------------------------------"
echo "Installing YaY"
echo "-------------------------------------------------"
cd ~/.local/share || exit
git clone "https://aur.archlinux.org/yay.git" yay
cd yay || exit
makepkg -si --noconfirm
cd "$SCRIPT_DIR" || exit

echo "-------------------------------------------------"
echo "Installing YaY packages"
echo "-------------------------------------------------"
yay -Sy --noconfirm - <packages/yaylist.txt

###################
###### Shell ######
###################
echo "-------------------------------------------------"
echo "Copy Fish configuration"
echo "-------------------------------------------------"
sudo pacman -Sy --noconfirm fish

chsh -s "$(which fish)"

echo "-------------------------------------------------"
echo "Copy configurations"
echo "-------------------------------------------------"
rsync -a .config/ "$HOME/.config/"

echo "-------------------------------------------------"
echo "Installing asdf plugins"
echo "-------------------------------------------------"
asdf plugin-add python https://github.com/danhper/asdf-python.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install python latest
asdf install nodejs latest

echo "-------------------------------------------------"
echo "Setup asdf global"
echo "-------------------------------------------------"
asdf global python latest
asdf global nodejs latest

echo "-------------------------------------------------"
echo "ASDF FIX: Update sudoers"
echo "-------------------------------------------------"
sudo awk '/root ALL=(ALL:ALL) ALL/ { print; print "Defaults secure_path=\"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\""; next }1' /etc/sudoers

echo "-------------------------------------------------"
echo "Change Docker permissions"
echo "-------------------------------------------------"
sudo usermod -aG docker "$USER"

echo "-------------------------------------------------"
echo "Update pacman yet again"
echo "-------------------------------------------------"
sudo pacman -Suyu --noconfirm
yay -Suyu --noconfirm

echo "-------------------------------------------------"
echo "Aplying some fixes"
echo "-------------------------------------------------"
# Fix for keychron keyboard function keys
# sudo touch /etc/modprobe.d/hid_apple.conf
# su root -c 'echo "options hid_apple fnmode=0" >> /etc/modprobe.d/hid_apple.conf'

# Create used folders
mkdir -p ~/Workspace/eu
mkdir -p ~/Workspace/self
mkdir -p ~/Workspace/configs

# Change swappiness
su root -c 'echo "vm.swappiness=10" >> /etc/sysctl.d/100-manjaro.conf'

# Enable fstrim
sudo systemctl enable fstrim.timer

# Enable xbox controller
sudo systemctl enable xboxdrv.service

# Avoid the wait bettween login attempts
su root -c 'echo "nodelay" >> /etc/security/faillock.conf'

echo "-------------------------------------------------"
echo "Change themes"
echo "-------------------------------------------------"
lookandfeeltool -a org.manjaro.breath-dark.desktop
