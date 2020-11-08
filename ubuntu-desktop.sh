#!/bin/bash
#
#Script for some software installation and configuration on Ubuntu desktop
#To run: wget -O - https://raw.githubusercontent.com/idenkov/shell-scripts/master/ubuntu-desktop.sh | bash

#Stupid hack to remove repos added furher, to avoid duplicate repos
sudo add-apt-repository -r ppa:nextcloud-devs/client

#Add additional repositories
sudo add-apt-repository -y ppa:nextcloud-devs/client

#Update
sudo apt update

#Remove unsused software
sudo apt purge -y rhythmbox thunderbird gnome-getting-started-docs gnome-user-docs gnome-user-guide

sudo apt upgrade -y

sudo apt install -y chromium-browser compton geany filezilla vlc gparted clementine compizconfig-settings-manager hexchat virt-manager curl whois pcmanfm nextcloud-client psensor vim i3 i3blocks xautolock lxappearance suckless-tools apg htop transmission-gtk git policykit-desktop-privileges policykit-1-gnome net-tools

sudo apt -y autoremove
sudo apt -y autoclean

#Creating config files directories
mkdir -p ~/.config/i3blocks/ ~/config/i3/

#Getting some config files
curl -o ~/.config/i3blocks/i3blocks.conf https://raw.githubusercontent.com/idenkov/configs/master/i3/i3blocks.conf
curl -o ~/.config/compton.conf https://raw.githubusercontent.com/idenkov/configs/master/i3/compton.conf
curl -o ~/.config/i3/config https://raw.githubusercontent.com/idenkov/configs/master/i3/config-desktop
curl -o ~/.vimrc https://raw.githubusercontent.com/idenkov/configs/master/.vimrc
