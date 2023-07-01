# Configuration script for Manjaro

## Clone repository

```sh
git clone --recurse-submodules https://github.com/iagocanalejas/manjaro-config.git
```

### Run the `.sh` configuration (will also run ansible).

```sh
  ./manjaro.autoconf.sh
```

### Run the ansible configuration.

```sh
  ansible-playbook manjaro.yaml --ask-become-pass --ask-vault-pass
```

# Next Steps

## Generate ssh keys

```sh
ssh-keygen -t ed25519 -C "iagocanalejas@gmail.com"
ssh-keygen -t rsa -b 2048

ssh-add /home/canalejas/.ssh/id_rsa </dev/null

# Add generated key paths in place
nano ~/.config/autostart/ssh-add.desktop
ssh-copy-id [user]@[ip]  # Copy the key
```

## Mount disk on boot

```sh
sudo mkdir /media/data

ls -al /dev/disk/by-uuid/ # Get UUID of the disk you want to mount

su root -c 'echo "UUID=<YOUR_UUID> /media/data   ext4    defaults        0       0" >> /etc/fstab'
```
