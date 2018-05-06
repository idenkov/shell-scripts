#!/bin/bash
#
#Script for some software installation and configuration on Ubuntu desktop
#To run: wget -0 - https://raw.githubusercontent.com/idenkov/shell-scripts/master/ubuntu-desktop.sh | bash

#Stupid hack to remove repos added furher, to avoid duplicate repos
sudo add-apt-repository -r ppa:nextcloud-devs/client
sudo add-apt-repository -r ppa:gencfsm

#Add additional repositories
sudo add-apt-repository -y ppa:nextcloud-devs/client
sudo add-apt-repository -y ppa:gencfsm

#Update
sudo apt update

#Remove unsused software
sudo apt purge -y rhythmbox thunderbird

sudo apt upgrade -y

sudo apt install -y chromium-browser compton geany filezilla vlc gparted clementine compizconfig-settings-manager hexchat virt-manager curl whois pcmanfm gnome-encfs-manager nextcloud-client psensor vim i3 i3blocks suckless-tools apg htop transmission-gtk

sudo apt -y autoremove
sudo apt -y autoclean

#Creating config files directories
mkdir -p ~/.config/i3blocks/ ~/config/i3/

#Getting some config files
curl -o ~/.config/i3blocks/i3blocks.conf https://raw.githubusercontent.com/idenkov/configs/master/i3/i3blocks.conf
curl -o ~/.config/compton.conf https://raw.githubusercontent.com/idenkov/configs/master/i3/compton.conf
curl -o ~/.config/i3/config https://raw.githubusercontent.com/idenkov/configs/master/i3/config-desktop