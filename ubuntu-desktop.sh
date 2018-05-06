#!/bin/bash
#
#Script for some software installation and configuration on Ubuntu desktop

#Add additional repositories
sudo add-apt-repository -y ppa:nextcloud-devs/client
sudo add-apt-repository -y ppa:gencfsm

#Update
sudo apt update

#Remove unsused software
sudo apt purge -y rhythmbox thunderbird

sudo apt upgrade -y

sudo apt install -y chromium-browser comptin geany filezilla vlc gparted clementine compizconfig-settings-manager \
hexchat virt-manager curl whois pcmanfm gnome-encfs-manager nextcloud-client psensor vim i3 i3blocks suckless-tools apg htop transmission-gtk

sudo apt -y autoremove
sudo apt -y autoclean

#Getting some config files
curl -o ~/.config/i3blocks/i3blocks.conf https://raw.githubusercontent.com/idenkov/configs/master/i3/i3blocks.conf
curl -o ~/.config/compton.conf https://raw.githubusercontent.com/idenkov/configs/master/i3/compton.conf
curl -o ~/config/i3/config https://raw.githubusercontent.com/idenkov/configs/master/i3/config-desktop