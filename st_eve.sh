#!/bin/bash

#Add user
echo "Change the password for the administrative user (pi)"
passwd pi
echo "Creating the user that runs the experiment (eve)"
adduser eve
adduser eve pi
adduser eve sudo 
adduser eve gpio
adduser eve i2c

#Change the timezone
echo -n "Enter the timezone: "
read timez
mv /etc/localtime /etc/localtime.backup
ln -sf /usr/share/zoneinfo/$timez /etc/localtime
echo "Changed."
echo ""

#Change the hostname
echo -n "Enter the Hostname (Network Name) of the Device: "
read hostn
hostnamectl set-hostname $hostn

echo "Changed."
echo ""

#Enable I2C
echo "dtparam=i2c_arm=on" >> /boot/config.txt
echo "i2c-dev" >> /etc/modules


#Install Packages
apt update -y && apt upgrade -y
apt install -y git python3 python3-pip libatlas-base-dev
#apt install -y nfs-kernel-server vim tmux

umask 022
pip3 install adafruit-circuitpython-ads1x15 adafruit-circuitpython-mcp230xx adafruit-circuitpython-onewire adafruit-circuitpython-ds18x20 numpy slackclient==1.3.2 pandas matplotlib configparser tornado dash

#Git Clone Repo
mkdir /eve
git clone https://github.com/vishhvaan/eve-pi.git /eve

#Copy Service to Location
cp /eve/webui/eve_webui.service /lib/systemd/system/eve_webui.service
chmod 644 /lib/systemd/system/eve_webui.service
systemctl enable eve_webui


#Set hostname in the files
awk '/address/{gsub(/hostname/,"$hostn")};{print}' /eve/webui/conf/conf.json > /eve/webui/conf/conf.json

#Setup file storage

#Reboot
echo "System will reboot now ..."
#reboot


