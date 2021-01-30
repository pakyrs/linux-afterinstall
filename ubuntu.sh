#!/bin/sh
# update & upgrade #
sudo apt update
sudo apt upgrade -y
#Desktop Environment
sudo apt install -y kde-standard #automate sddm prompt?
#Base tools:
sudo apt install net-tools -y
sudo apt install gnupg -y
sudo apt install tldr -y
sudo apt install curl -y
sudo apt install git -y
sudo apt install lsb-release -y
sudo apt install lsb-base -y
sudo apt install lsb-core -y 
sudo apt install openssh -y
sudo apt install htop -y
sudo apt install wget -y
sudo apt install vim-enhanced -y
sudo apt install nmap -y
sudo apt install ufw -y
sudo apt install gufw -y
sudo apt install fonts-powerline -y 
sudo apt install ttf-mscorefonts-installer -y #accept eula prompt?
sudo apt install sshuttle -y
sudo apt install tmate -y
sudo apt install magic-wormhole -y
sudo apt install tree -y
sudo apt install screen -y
sudo apt install pwgen -y
sudo apt install dnsutils -y
sudo apt install gdebi -y
sudo apt install neofetch -y 
sudo apt install gparted -y
sudo apt install ubuntu-restricted-extras -y
#Shenanigans:
sudo apt install cmatrix  
# add custom sources and PPA's #
sudo sh -c "echo '## PPA ###' >> /etc/apt/sources.list"
# Balena etcher
echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
sudo apt update && sudo apt install balena-etcher-electron -y
# vivaldi ERROR GPG KEY
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository 'deb https://repo.vivaldi.com/archive/deb/ stable main'
sudo apt update && sudo apt install vivaldi-stable -y
# Ulauncher NEED TO PRESS ENTER
sudo add-apt-repository ppa:agornostal/ulauncher
sudo apt update && sudo apt install ulauncher -y
# Insync
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C
deb http://apt.insync.io/ubuntu groovy non-free contrib
sudo apt update && sudo apt install insync insync-dolphin insync-nautilus -y
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
# libreoffice
# games
## Bomgar
## Inevidesk
## APPIMAGES:
## Biscuit
##https://eatbiscuit.com/#download
## Microsoft Teams
##https://go.microsoft.com/fwlink/p/?LinkID=2112886&clcid=0x409&culture=en-us&country=US
## UPDATE GRUB to allow ZFS rollback
sudo vim /etc/default/grub
sed "GRUB_TIMEOUT_STYLE" menu
sed GRUB_TIMEOUT=5
sudo update grub

