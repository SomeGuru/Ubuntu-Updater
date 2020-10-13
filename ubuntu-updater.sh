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
apt-fast install -f
apt-get autoremove
apt-get clean all
apt-get autoclean
sleep 3
clear
echo "#####################################"
echo "Updating process initialized..."
echo "#####################################"
apt-fast update
sleep 5
clear
echo "#####################################"
echo "Upgrading process initialized..."
echo "#####################################"
apt-fast upgrade
sleep 5
clear
echo "#####################################"
echo "Updating Distro..."
echo "#####################################"
apt-fast dist-upgrade
apt-get install unattended-upgrades
unattended-upgrade
sleep 5
clear
echo "#####################################"
echo "Cleaning up the messes..."
echo "#####################################"
apt-fast --purge autoremove
apt-fast autoclean
echo "#####################################"
echo "Cleaning up..."
echo "#####################################"
apt-get clean all
sleep 5
clear
echo "#####################################"
echo "Finished !!!"
echo "#####################################"
