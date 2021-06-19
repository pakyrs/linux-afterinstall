#!/bin/bash

#==============================================================================
#
#         FILE: popos.sh
#        USAGE: sudo popos.sh
#
#  DESCRIPTION: Post-installation install script for PopOS 20 / 21
#      WEBSITE: https://github.com/David-Else/fedora-ultimate-setup-script
#
# REQUIREMENTS: Fresh copy of PopOS 20 / 21
#       AUTHOR: Pascal
#      COMPANY: WIT
#      VERSION: 1.0
#
#==============================================================================
# PREREQUISITES AND REPOS
#==============================================================================
sudo apt update -y && sudo apt dist-upgrade -y
# Balena etcher
echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
sudo apt update && sudo apt install balena-etcher-electron -y
# vivaldi
wget -qO- http://repo.vivaldi.com/stable/linux\_signing\_key.pub | sudo apt-key add -
sudo add-apt-repository "deb http://repo.vivaldi.com/stable/deb/ stable main"
sudo apt install -y vivaldi-stable
# Insync
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C
deb http://apt.insync.io/ubuntu groovy non-free contrib
sudo apt update && sudo apt install insync insync-dolphin insync-nautilus -y
# Codecs:
sudo add-apt-repository multiverse
sudo apt install ubuntu-restricted-extras

#==============================================================================
# PACKAGES TO INSTALL / REMOVE
#==============================================================================
packages_to_remove=(
    rhythmbox
	libreoffice
	gnome-mahjong
	aisleriot
	gnome-mines
	gnome-todo
)

packages_to_install=(
	kde-plasma-desktop
	transmission-gtk
	fuse-exfat
	lshw
	shotwell
	tldr
	vim
 	curl
	cabextract
	xorg-x11-font-utils
	fontconfig
	neofetch
	kdiskmark
	p7zip
	p7zip-plugins
	p7zip-gui 
	net-tools 
	tree 
	gnupg 
	tldr 
	curl 
	wget 
	git 
	htop 
	nmap 
	ufw 
	telnet
	tmate 
	screen 
	pwgen 
	dnsutils 
	gparted 
	openssh 
	powerline 
	sshuttle 
	speedtest-cli 
	ipcalc 
	meld 
	mtr 
	mc 
	guake 
	iftop 
	iperf 
	tmux 
	ncdu 
	cmatrix 
	figlet 
	remmina 
	redshift 
	scribus 
	ettercap 
	freerdp 
	gimp 
	bleachbit 
	qbittorrent 
	filezilla 
	flameshot 
	inkscape 
	alacritty 
	htop 
	magic-wormhole 
	asciiquarium
	kvantum  # kvantum repo
	vivaldi-stable  # vivaldi repo
	vlc 
	handbrake 
	wine-stable # fedora specific
	)

#==============================================================================
# install packages
#==============================================================================
echo "${BOLD}Removing unwanted programs...${RESET}"
apt remove --purge -y "${packages_to_remove[@]}"

echo "${BOLD}Updating Debian...${RESET}"
apt update -y && apt dist-upgrade -y

echo "${BOLD}Installing packages...${RESET}"
apt install -y "${packages_to_install[@]}"


#==============================================================================

# SNAPS
sudo dnf install snapd
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install bitwarden
sudo snap install netdiscover-ondra
sudo snap install onlyoffice-desktopeditors
sudo snap install code --classic
sudo snap install authy --beta
sudo snap install auto-cpufreq
sudo snap install powershell-preview --classic 

cd ~/Downloads/
## Surfshark VPN
wget --show-progress https://ocean.surfshark.com/debian/pool/main/s/surfshark-release/surfshark-release\_1.0.0-1.1\_amd64.deb
sudo dpkg -i ~/Downloads/surfshark-release\_1.0.0-1.1\_amd64.deb
## Teamviewer
wget --show-progress https://download.teamviewer.com/download/linux/teamviewer\_amd64.deb 
sudo apt install ~/Downloads/teamviewer\_amd64.deb -y
## Zoom
wget --show-progress https://zoom.us/client/latest/zoom\_amd64.deb 
sudo apt install ~/Downloads/zoom\_amd64.deb -y
## Parsec Gaming
wget --show-progress https://builds.parsecgaming.com/package/parsec-linux.deb
sudo apt install ~/Downloads/parsec-linux.deb -y

# AppImageLauncher 
wget --show-progress https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
sudo apt install ~/Downloads/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb -y

# APPIMAGES
# Obsidian 
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v0.12.3/Obsidian-0.12.3.AppImage
wget https://github.com/agata/dl.biscuit/releases/download/v1.2.20/Biscuit-1.2.20.AppImage
# pcloud image download from website
# manually integrate teh apps

# FIX login manager
sudo systemctl disable gdm
sudo systemctl enable sddm

# FIX virtualization settings
# sudo vi /etc/libvirt/libvirtd.conf
#--- USE SED
#unix_sock_group = "libvirt" # uncomment
#unix_sock_rw_perms = "0770" # uncomment
#---
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
sudo usermod -a -G libvirt $(whoami)
