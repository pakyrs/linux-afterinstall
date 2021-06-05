#!/bin/bash
# update
sudo dnf upgrade -y

# REPOS

# Fusion Free
sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
# Fusion non-free
sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
# vivaldi
sudo dnf config-manager --add-repo https://repo.vivaldi.com/archive/  
vivaldi-fedora.repo  
# COPR
sudo dnf copr enable gagbo/Kvantum
sudo dnf copr enable hubbitus/remmina-next

# PACKAGES
sudo dnf install -y \
	vim \ 
	curl \
	cabextract \
	xorg-x11-font-utils \
	fontconfig \
	dnf-utils \
	neofetch \
	kdiskmark \
	p7zip \
 	p7zip-plugins \
 	p7zip-gui \
	net-tools \
	tree \
	gnupg \
	tldr \
	curl \
	wget \
	git \
	htop \
	nmap \
	ufw \
	tmate \
	screen \
	pwgen \
	dnsutils \
	gparted \
	openssh \
	powerline \
	sshuttle \
	speedtest-cli \
	ipcalc \
	meld \
	mtr \
	mc \
	guake \
	iftop \
	iperf \
	tmux \
	ncdu \
	cmatrix \
	figlet \
	remmina \
	redshift \
	scribus \
	ettercap \
	freerdp \
	gimp \
	virt-manager \
	bleachbit \
	qbittorrent \
	filezilla \
	flameshot \
 	inkscape \
	alacritty \
	htop \
	latte-dock \
	magic-wormhole \
	kvantum \ # kvantum repo
	vivaldi-stable \ # vivaldi repo
	vlc \ # fusion
	handbrake # fusion
	

# KDE Plasma
sudo dnf install @kde-desktop
sudo systemctl disable gdm
sudo systemctl enable sddm

# Virt-Manager
sudo dnf install @virtualization
sudo vi /etc/libvirt/libvirtd.conf
---
unix_sock_group = "libvirt" # uncomment
unix_sock_rw_perms = "0770" # uncomment
---
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
sudo usermod -a -G libvirt $(whoami)

# SNAPS
sudo dnf install snapd
sudo ln -s /var/lib/snapd/snap /snap
sudo snap set system experimental.parallel-instances=true # parallels installs
sudo snap install bitwarden \ 
	netdiscover-ondra \
	onlyoffice-desktopeditors \
	code --classic \
	authy --beta 


# APPIMAGES

# AppImageLauncher
# https://github.com/TheAssassin/AppImageLauncher/releases
wget https://github.com/TheAssassin/AppImageLauncher/releases/download/continuous/appimagelauncher-2.2.0-gha53.3f901f6.arm64.rpm
sudo dnf in appimagelauncher-2.2.0-gha53.3f901f6.arm64.rpm

# Obsidian 
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v0.12.3/Obsidian-0.12.3.AppImage
chmod +x Obsidian-0.12.3.AppImage
ail-cli integrate Obsidian-0.12.3.AppImage

# Biscuit
wget https://github.com/agata/dl.biscuit/releases/download/v1.2.20/Biscuit-1.2.20.AppImage
chmod +x Biscuit-1.2.20.AppImage
ali-cli integrate Biscuit-1.2.20.AppImage



# RPMs
# TeamViewer
wget https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm
sudo dnf -y install teamviewer.x86_64.rpm
# Zoom
wget https://zoom.us/client/latest/zoom_x86_64.rpm
sudo dnf install -y zoom_x86_64.rpm
# Etcher
wget https://github.com/balena-io/etcher/releases/download/v1.5.120/balena-etcher-electron-1.5.120.x86_64.rpm
sudo dnf install -y balena-etcher-electron-1.5.120.x86_64.rpm
# PowerShell
sudo dnf install -y https://github.com/PowerShell/PowerShell/releases/download/v7.1.3/powershell-7.1.3-1.rhel.7.x86_64.rpm
# Microsoft Fonts
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm 
