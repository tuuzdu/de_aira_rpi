### Raspberry Pi 3 AIRA NixOS image

#### Prepare
Download base image and copy it to sd card:
```sh
wget https://www.cs.helsinki.fi/u/tmtynkky/nixos-arm/installer/sd-image-aarch64-linux.img
sudo dd if=sd-image-aarch64-linux.img bs=1M of=/dev/sdX conv=fsync
```
Turn on Raspberry, set password and start sshd:
```sh
passwd
systemctl start sshd
```

#### Build NixOS
Connect to Raspberri with ssh:
```sh
ssh root@<ip-address>
```
Download and run script:
```sh
curl --insecure https://raw.githubusercontent.com/tuuzdu/de_aira_rpi/82b68f2b3f81864125096c6762b092260a1bb3c7/nixos_build_rpi.sh --output nixos_install_rpi.sh -L
chmod +x nixos_install_rpi.sh
./nixos_install_rpi.sh
```
