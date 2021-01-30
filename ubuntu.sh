#!/bin/sh
# update & upgrade #
sudo apt update
sudo apt upgrade -y
#Desktop Environment
sudo apt install -y kde-standard #automate sddm prompt?
#Base tools:
sudo apt install -y net-tools gnupg tldr curl wget git lsb-release lsb-base lsb-core openssh htop vim nmap ufw gufw sshuttle tmate screen 
pwgen dnsutils gdebi neofetch gparted ubuntu-restricted-extras
sudo apt install fonts-powerline -y 
sudo apt install ttf-mscorefonts-installer -y #accept eula prompt?
#Shenanigans:
sudo apt install -y cmatrix  
# REMOVE some unneeded apps #
sudo apt-get remove gnome-games gnome-games-common empathy
# INSTALL new apps #
sudo apt install vlc -y
sudo apt install remmina -y
sudo apt install terminator -y
sudo apt install gimp -y 
sudo apt install virt-manager -y
sudo apt install virtualbox -y
sudo apt install bleachbit -y
sudo apt install wireshark  -y #should non super-user capture packets?
sudo apt install qbittorrent  -y
sudo apt install ettercap-graphical -y 
sudo apt install filezilla -y
sudo apt install flameshot -y
sudo apt install inkscape -y
sudo apt install handbrake -y 
sudo apt install leocad -y
sudo apt install redshift -y
sudo apt install scribus -y 
sudo apt install latte-dock -y
# INSTALL SNAPS
sudo snap install bitwarden 
sudo snap install spotify 
sudo snap install moonlight  
sudo snap install authy --beta 
sudo snap install code --classic 
sudo snap install onlyoffice-desktopeditors 
sudo snap install powershell-preview --classic 
# INSTALL deb files from directory #
cd ~/Downloads
## Surfshark VPN
wget --show-progress https://ocean.surfshark.com/debian/pool/main/s/surfshark-release/surfshark-release_1.0.0-1.1_amd64.deb
sudo dpkg -i ~/Downloads/surfshark-release_1.0.0-1.1_amd64.deb
## Teamviewer
wget --show-progress https://download.teamviewer.com/download/linux/teamviewer_amd64.deb 
sudo apt install ~/Downloads/teamviewer_amd64.deb -y
## Zoom
wget --show-progress https://zoom.us/client/latest/zoom_amd64.deb 
sudo apt install ~/Downloads/zoom_amd64.deb -y
## Parsec Gaming
wget --show-progress https://builds.parsecgaming.com/package/parsec-linux.deb
sudo apt install ~/Downloads/parsec-linux.deb -y
# UNINSTALL APPS that are not needed
sudo apt remove --purge -y libreoffice*
sudo apt clean
sudo apt autoremove
# games
## Bomgar
## Inevidesk
## APPIMAGES:
## Biscuit
##https://eatbiscuit.com/#download
## Microsoft Teams
##https://go.microsoft.com/fwlink/p/?LinkID=2112886&clcid=0x409&culture=en-us&country=US
## UPDATE GRUB to allow ZFS rollback
sudo sed -i 's/GRUB_TIMEOUT=[0-9]*/GRUB_TIMEOUT=5/g' /etc/default/grub
sudo sed -i 's/GRUB_TIMEOUT_STYLE=hidden*/GRUB_TIMEOUT_STYLE=menu/g' /etc/default/grub
sudo update-grub
# add custom sources and PPA's #
# Balena etcher
echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
sudo apt update && sudo apt install balena-etcher-electron -y
# vivaldi
wget -qO- http://repo.vivaldi.com/stable/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository "deb http://repo.vivaldi.com/stable/deb/ stable main"
sudo apt install -y vivaldi-stable
# Ulauncher NEED TO PRESS ENTER
sudo add-apt-repository ppa:agornostal/ulauncher
sudo apt update && sudo apt install -y ulauncher
# Insync
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C
deb http://apt.insync.io/ubuntu groovy non-free contrib
sudo apt update && sudo apt install insync insync-dolphin insync-nautilus -y

