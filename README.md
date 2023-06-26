# Configuration script for Manjaro

```sh
git clone --recursive-submodules https://github.com/iagocanalejas/manjaro-config.git
```

```sh
  ./manjaro.autoconf.sh
  ansible-playbook manjaro.yml --ask-become-pass --ask-vault-pass
```

# Next Steps

## Generate ssh keys

```sh
ssh-keygen -t ed25519 -C "iagocanalejas@gmail.com" # Github key
ssh-keygen -t rsa -b 2048 # RaspberryPi key

ssh-add /home/canalejas/.ssh/github </dev/null
ssh-add /home/canalejas/.ssh/raspi </dev/null

nano ~/.config/autostart/ssh-add.desktop  # Add github and raspi paths in '[ssh keys]' place
ssh-copy-id pi@[pi_ip]  # Copies raspi key to a raspberry
```

## Mount disk on boot

```sh
sudo mkdir /media/data

ls -al /dev/disk/by-uuid/ # Get UUID of the disk you want to mount

su root -c 'echo "UUID=<YOUR_UUID> /media/data   ext4    defaults        0       0" >> /etc/fstab'
```
