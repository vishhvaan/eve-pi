#!/bin/bash

sudo adduser eve
sudo adduser eve pi
sudo adduser eve sudo 
sudo adduser eve gpio
sudo adduser eve i2c

# raspi-config to enable i2c and change timezone
# probably possible to od this automatically

sudo apt update && sudo apt upgrade -y

sudo apt install -y git python3 python3-pip nfs-kernel-server vim tmux libatlas-base-dev

umask 022
sudo pip3 install adafruit-circuitpython-ads1x15 adafruit-circuitpython-mcp230xx numpy slackclient pandas matplotlib configparser

# setting up NFS with EXTREMELY LOOSE SECURITY XD
echo "/eve   10.0.0.0/8(rw,sync,no_subtree_check)" >> /etc/exports
sudo systemctl enable nfs-kernel-server.service
sudo systemctl start nfs-kernel-server.service

echo "//smb-isi1.lerner.ccf.org/scottj10lab/MorbidoData/ /mnt/morbidodata cifs credentials=/home/eve/.smbcredentials,uid=1001,gid=1001 0 0" >> /etc/fstab

## GIT CLONE THE REPO ##
