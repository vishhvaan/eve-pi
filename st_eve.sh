#!/bin/bash

#Add user
adduser eve
adduser eve pi
adduser eve sudo 
adduser eve gpio
adduser eve i2c
passwd eve

#Change the timezone
echo -n "Enter the timezone:"
read timez

echo "Changed."
echo ""

#Change the hostname
echo -n "Enter the Hostname (Network Name) of the Device:"
read hostn
hostnamectl set-hostname $hostn

echo "Changed."
echo ""

#Enable I2C
echo "dtparam=i2c_arm=on" >> /boot/config.txt
echo "i2c-dev" >> /etc/modules


#Install Packages
apt update && sudo apt upgrade -y
apt install -y git python3 python3-pip nfs-kernel-server vim tmux libatlas-base-dev

umask 022
pip3 install adafruit-circuitpython-ads1x15 adafruit-circuitpython-mcp230xx numpy slackclient pandas matplotlib configparser

#Git Clone Repo
mkdir /eve
git clone https://github.com/vishhvaan/eve-pi.git /eve

#Copy Service to Location


echo "//smb-isi1.lerner.ccf.org/scottj10lab/MorbidoData/ /mnt/morbidodata cifs credentials=/home/eve/.smbcredentials,uid=1001,gid=1001 0 0" >> /etc/fstab

