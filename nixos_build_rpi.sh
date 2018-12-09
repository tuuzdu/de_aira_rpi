#!/usr/bin/env bash

echo "Dowloading NixOS configuration for Raspberry Pi 3..."
NIX_CFG="https://raw.githubusercontent.com/tuuzdu/de_aira_rpi/ed8fa0e20911fdf440dc8759c165f509729668c2/configuration.nix"
curl --insecure $NIX_CFG --output configuration.nix -L
mv configuration.nix /etc/nixos/

echo "Dowloading and unpacking airapkgs..."
curl --insecure https://github.com/tuuzdu/airapkgs/archive/nixos-unstable.tar.gz --output airapkgs.tar.gz -L
tar xvf airapkgs.tar.gz

echo "Enable swap"
fallocate -l 4G /swapfile && chmod 600 /swapfile && mkswap /swapfile && swapon /swapfile

echo "Use fdisk to remove the bootable flag from the FAT32 partition, and set it for the ext4 partition"
umount /boot && fdisk /dev/mmcblk0

echo "Building..."
nixos-rebuild switch -I nixpkgs=/root/airapkgs-nixos-unstable --cores 4