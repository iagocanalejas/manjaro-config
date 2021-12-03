#!/bin/bash

SCRIPT_DIR=$(pwd)

echo "-------------------------------------------------"
echo "Update pacman mirrors"
echo "-------------------------------------------------"
sudo pacman-mirrors -g

#Add parallel downloading
sudo sed -i 's/^#Para/Para/' /etc/pacman.conf

echo "-------------------------------------------------"
echo "Update pacman"
echo "-------------------------------------------------"
sudo pacman -Suyu --noconfirm

echo "-------------------------------------------------"
echo "Uninstalling packages"
echo "-------------------------------------------------"
sudo pacman -Rsn --noconfirm - < packages/uninstall.txt

echo "-------------------------------------------------"
echo "Installing pacman packages"
echo "-------------------------------------------------"
sudo pacman -Sy --noconfirm - < packages/pkglist.txt

echo "-------------------------------------------------"
echo "Installing YaY"
echo "-------------------------------------------------"
cd ~/.local/share
git clone "https://aur.archlinux.org/yay.git" yay
cd yay
makepkg -si --noconfirm
cd $SCRIPT_DIR

echo "-------------------------------------------------"
echo "Installing YaY packages"
echo "-------------------------------------------------"
yay -Sy --noconfirm - < packages/yaylist.txt

echo "-------------------------------------------------"
echo "Installing asdf"
echo "-------------------------------------------------"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
cd $SCRIPT_DIR

echo "-------------------------------------------------"
echo "Copy Zsh configuration"
echo "-------------------------------------------------"
cp $SCRIPT_DIR/config/.zshrc $HOME/.zshrc
mkdir -p $HOME/.zsh_functions

chsh -s $(which zsh)

echo "-------------------------------------------------"
echo "Copy configurations"
echo "-------------------------------------------------"
rsync -a .config/ $HOME/.config/
mkdir ~/Workspace

# Change swappiness
su root -c 'echo "vm.swappiness=10" > /etc/sysctl.d/100-manjaro.conf'

# Enable fstrim
sudo systemctl enable fstrim.timer

echo "-------------------------------------------------"
echo "Installing asdf plugins"
echo "-------------------------------------------------"
$HOME/.asdf/asdf.sh plugin-add python https://github.com/danhper/asdf-python.git
$HOME/.asdf/asdf.sh plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
$HOME/.asdf/asdf.sh install python latest
$HOME/.asdf/asdf.sh install nodejs latest

echo "-------------------------------------------------"
echo "Update pacman yet again"
echo "-------------------------------------------------"
sudo pacman -Suyu --noconfirm
yay -Suyu --noconfirm

echo "-------------------------------------------------"
echo "Prepare snap and snap packages"
echo "-------------------------------------------------"
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install code --classic

echo "-------------------------------------------------"
echo "Aplying some fixes"
echo "-------------------------------------------------"
# Fix for keychron keyboard function keys
sudo touch /etc/modprobe.d/hid_apple.conf
su root -c 'echo "options hid_apple fnmode=0" > /etc/modprobe.d/hid_apple.conf'

# Avoid the wait bettween login attempts
sudo echo "nodelay" >> /etc/security/faillock.conf

echo "Install Gkraken"
flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak --user install flathub com.leinardi.gkraken
flatpak run com.leinardi.gkraken --add-udev-rule

echo "-------------------------------------------------"
echo "Following programs needs to be manually installed"
echo "-------------------------------------------------"
echo $(<packages/manual-install.txt)
