#!/bin/bash

SCRIPT_DIR=$(pwd)

# Supported shells
FISH_VALUE="fish"
ZSH_VALUE="zsh"

# Supported PCs
PC_VALUE="desktop"
MI_VALUE="notebook"

while getopts s:c: flag; do
    case "${flag}" in
    s) shell=${OPTARG} ;;
    c) computer=${OPTARG} ;;
    *) exit 1 ;;
    esac
done

# Default shell
if [ -z "$shell" ]; then
    shell="$FISH_VALUE"
fi

# Default computer
if [ -z "$computer" ]; then
    computer="$PC_VALUE"
fi

if [ "$shell" != "$FISH_VALUE" ] && [ "$shell" != "$ZSH_VALUE" ]; then
    echo "-s valid values are [\"fish\", \"zsh\"]"
    exit 1
fi

if [ "$computer" != "$PC_VALUE" ] && [ "$computer" != "$MI_VALUE" ]; then
    echo "-c valid values are [\"desktop\", \"notebook\"]"
    exit 1
fi

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
sudo pacman -Rsn --noconfirm - <packages/uninstall.txt

echo "-------------------------------------------------"
echo "Installing pacman packages"
echo "-------------------------------------------------"
sudo pacman -Sy --noconfirm git make gcc base-devel
sudo pacman -Sy --noconfirm - <packages/pacman/pkglist.txt

echo "-------------------------------------------------"
echo "Installing pacman specific ${computer} packages"
echo "-------------------------------------------------"
sudo pacman -Sy --noconfirm - <"packages/pacman/pkglist_${computer}.txt"

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
yay -Sy --noconfirm - <packages/yay/yaylist.txt

echo "-------------------------------------------------"
echo "Installing YaY specific ${computer} packages"
echo "-------------------------------------------------"
yay -Sy --noconfirm - <"packages/yay/yaylist_${computer}.txt"

###################
###### Shell ######
###################
if [ "$shell" = "$ZSH_VALUE" ]; then
    echo "-------------------------------------------------"
    echo "Copy Zsh configuration"
    echo "-------------------------------------------------"
    sudo pacman -Sy --noconfirm zsh zsh-syntax-highlighting zsh-autosuggestions

    cp "$SCRIPT_DIR/config/.zshrc" "$HOME/.zshrc"
    mkdir -p "$HOME/.zsh_functions"

    chsh -s "$(which zsh)"
fi

if [ "$shell" = "$FISH_VALUE" ]; then
    echo "-------------------------------------------------"
    echo "Copy Fish configuration"
    echo "-------------------------------------------------"
    sudo pacman -Sy --noconfirm fish

    chsh -s "$(which fish)"
fi

echo "-------------------------------------------------"
echo "Copy configurations"
echo "-------------------------------------------------"
rsync -a .config/ "$HOME/.config/"

if [ "$computer" = "$PC_VALUE" ]; then
    echo "-------------------------------------------------"
    echo "Installing asdf plugins"
    echo "-------------------------------------------------"
    asdf plugin-add python https://github.com/danhper/asdf-python.git
    asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
    asdf plugin-add gradle https://github.com/rfrancis/asdf-gradle.git
    asdf install python latest
    asdf install nodejs latest
    asdf install gradle latest

    echo "-------------------------------------------------"
    echo "Change Docker permissions"
    echo "-------------------------------------------------"
    sudo usermod -aG docker "$USER"
fi

if [ "$computer" = "$MI_VALUE" ]; then
    if [ "$shell" = "$FISH_VALUE" ]; then
        sed -i 's/^source \/opt\/asdf-vm\/asdf.fish/# source \/opt\/asdf-vm\/asdf.fish/' "$HOME/.config/fish/config.fish"
    else
        '\. \/opt\/asdf-vm\/asdf.sh'
        sed -i 's/^\. \/opt\/asdf-vm\/asdf.sh/# \. \/opt\/asdf-vm\/asdf.sh/' "$HOME/.zshrc"
    fi
fi

echo "-------------------------------------------------"
echo "Update pacman yet again"
echo "-------------------------------------------------"
sudo pacman -Suyu --noconfirm
yay -Suyu --noconfirm

echo "-------------------------------------------------"
echo "Aplying some fixes"
echo "-------------------------------------------------"
if [ "$computer" = "$PC_VALUE" ]; then
    # Fix for keychron keyboard function keys
    sudo touch /etc/modprobe.d/hid_apple.conf
    su root -c 'echo "options hid_apple fnmode=0" >> /etc/modprobe.d/hid_apple.conf'

    mkdir -p ~/Workspace/work
fi

# Change swappiness
su root -c 'echo "vm.swappiness=10" >> /etc/sysctl.d/100-manjaro.conf'

# Enable fstrim
sudo systemctl enable fstrim.timer

# Avoid the wait bettween login attempts
su root -c 'echo "nodelay" >> /etc/security/faillock.conf'

echo "-------------------------------------------------"
echo "Change themes"
echo "-------------------------------------------------"
lookandfeeltool -a org.manjaro.breath-dark.desktop
