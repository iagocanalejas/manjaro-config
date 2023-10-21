#!/bin/bash

SCRIPT_DIR=$(pwd)

echo "-------------------------------------------------"
echo "Update pacman mirrors"
echo "-------------------------------------------------"
sudo pacman-mirrors -g

# Add parallel downloading
sudo sed -i 's/^#Para/Para/' /etc/pacman.conf
sudo sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist

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

echo "-------------------------------------------------"
echo "Copy configurations"
echo "-------------------------------------------------"
rsync -a .config/ "$HOME/.config/"

echo "-------------------------------------------------"
echo "Install fisher & fisher plugins"
echo "-------------------------------------------------"
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install jorgebucaran/nvm.fish

echo "-------------------------------------------------"
echo "Change some directories permissions"
echo "-------------------------------------------------"
sudo mkdir -p /usr/local/n /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
sudo chown -R $(whoami) /usr/local/n /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
sudo chmod -R 777 /usr/local/share

echo "-------------------------------------------------"
echo "Running ansible playbook"
echo "-------------------------------------------------"
ansible-playbook manjaro.yaml --ask-become-pass --ask-vault-pass

echo "-------------------------------------------------"
echo "Update pacman yet again"
echo "-------------------------------------------------"
sudo pacman -Suyu --noconfirm
yay -Suyu --noconfirm
