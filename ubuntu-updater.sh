#!/bin/bash

# if not root, run as root do not modify below unless making direct path to file in line 5. 
if (( EUID != 0 )); then
    sudo ~/ubuntu-updater.sh
    exit
fi

echo "Mike Larios Oct'20"
echo ""
echo "#####################################"
echo "Initializing Updates..."
echo "#####################################"
sleep 5
clear
echo "Auto-removing unnecessary stuff"
dpkg --configure -a
apt-get install -f
apt-get autoremove
apt-get clean all
apt-get autoclean
sleep 3
clear
echo "#####################################"
echo "Updating process initialized..."
echo "#####################################"
apt-get update
sleep 5
clear
echo "#####################################"
echo "Upgrading process initialized..."
echo "#####################################"
apt-get upgrade -y
sleep 5
clear
echo "#####################################"
echo "Updating Distro..."
echo "#####################################"
apt-get dist-upgrade
apt-get install unattended-upgrades
unattended-upgrade
sleep 5
clear
echo "#####################################"
echo "Cleaning up the messes..."
echo "#####################################"
apt-get --purge autoremove
apt-get autoclean
echo "#####################################"
echo "Cleaning up..."
echo "#####################################"
apt-get clean all
sleep 5
clear
echo "#####################################"
echo "Finished !!!"
echo "#####################################"
