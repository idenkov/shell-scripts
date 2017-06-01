#!/bin/bash
#
#Script to install for Ubutnu Unity desktop to install some of the software I use
#Should be run as root

#Add additional repositories
add-apt-repository -y ppa:nextcloud-devs/client
add-apt-repository -y ppa:gencfsm

#Update
apt update

#Remove unsused software
apt purge -y rhythmbox thunderbird

apt upgrade -y

apt install -y software-center chromium-browser geany filezilla vlc gparted clementine compizconfig-settings-manager \
hexchat virt-manager gimp pcmanfm gnome-encfs-manager nextcloud-client psensor vim htop transmission-gtk

apt -y autoremove
apt -y autoclean
