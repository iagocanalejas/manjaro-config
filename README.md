# Configuration script for Arch Linux
```sh
./manjaro.autoconf.sh
```

## Steps
- Configure mirrors and pacman.
  ```sh
  sudo pacman-mirrors -g
  sudo sed -i 's/^#Para/Para/' /etc/pacman.conf  
  sudo pacman -Suyu --noconfirm
  ```
- Remove unwanted packages
  ```sh
  sudo pacman -Rsn --noconfirm - < packages/uninstall.txt
  ```
- Installs `Yay`.
  ```sh
  cd ~/.local/share
  git clone "https://aur.archlinux.org/yay.git" yay
  cd yay
  makepkg -si --noconfirm
  cd $SCRIPT_DIR
  ```
- Prepare `snap`.
  ```sh
  sudo ln -s /var/lib/snapd/snap /snap
  sudo snap install code --classic
  ```
- Installs `asdf`.
  ```sh
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
  cd ~/.asdf
  cd $SCRIPT_DIR
  ```
- Install packages.
  ```sh
  sudo pacman -Sy --noconfirm - < packages/pkglist.txt
  yay -Sy --noconfirm - < packages/yaylist.txt

  $HOME/.asdf/asdf.sh plugin-add python https://github.com/danhper/asdf-python.git
  $HOME/.asdf/asdf.sh plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  $HOME/.asdf/asdf.sh install python latest
  $HOME/.asdf/asdf.sh install nodejs latest
  ```
- Change default programs and configurations.
  ```sh
  # ZSH
  cp $SCRIPT_DIR/config/.zshrc $HOME/.zshrc
  mkdir -p $HOME/.zsh_functions
  chsh -s $(which zsh)

  # Configs
  rsync -a .config/ $HOME/.config/
  mkdir ~/Workspace

  # Change swappiness
  su root -c 'echo "vm.swappiness=10" > /etc/sysctl.d/100-manjaro.conf'

  # Enable fstrim
  sudo systemctl enable fstrim.timer
  ```
- Apply some fixes
  ```sh
  # Fix for keychron keyboard function keys
  sudo touch /etc/modprobe.d/hid_apple.conf
  su root -c 'echo "options hid_apple fnmode=0" > /etc/modprobe.d/hid_apple.conf'

  # Avoid the wait bettween login attempts
  sudo echo "nodelay" >> /etc/security/faillock.conf
  ```

## Next Manual Steps
### Generate ssh keys
```sh
ssh-keygen -t ed25519 -C "iagocanalejas@gmail.com" # Github key
ssh-keygen -t rsa -b 2048 # RaspberryPi key

ssh-add /home/canalejas/.ssh/github </dev/null
ssh-add /home/canalejas/.ssh/raspi </dev/null

nano ~/.config/autostart/ssh-add.desktop  # Add github and raspi paths in '[ssh keys]' place
ssh-copy-id pi@[pi_ip]  # Copies raspi key to a raspberry
``` 