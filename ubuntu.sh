#!/bin/sh
# update & upgrade #
sudo apt update
sudo apt upgrade -y
#Zsys Garbage collection policy
cd ~/Downloads
git clone https://github.com/ubuntu/zsys
sudo cp ~/Downloads/zsys/internal/config/zsys.conf /etc/
sudo zsysctl service reload
#Desktop Environment
sudo apt install -y kde-standard #automate sddm prompt?
#Base tools:
sudo apt install -y net-tools tree gnupg tldr curl wget git lsb-release lsb-base lsb-core htop vim nmap ufw gufw sshuttle tmate screen pwgen dnsutils gdebi neofetch gparted ubuntu-restricted-extras openssh-server
sudo apt install fonts-powerline -y 
sudo apt install ttf-mscorefonts-installer -y #accept eula prompt?
#Shenanigans:
sudo apt install -y cmatrix figlet hollywood
# INSTALL new apps #
sudo DEBIAN_FRONTEND=noninteractive apt -yq install wireshark
sudo apt install vlc -y
sudo apt install remmina -y
sudo apt install terminator -y
sudo apt install gimp -y 
sudo apt install virt-manager -y
sudo apt install virtualbox -y
sudo apt install bleachbit -y
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
sudo apt remove --purge -y thunderbird*
sudo apt remove --purge -y rhythmbox*
sudo apt remove --purge -y gnome-mahjongg
sudo apt remove --purge -y aisleriot
sudo apt remove --purge -y gnome-mines
sudo apt remove --purge -y gnome-todo
sudo apt clean
sudo apt autoremove -y
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
## FUSUMA MACOSX GESTURES
sudo gpasswd -a $USER input
newgrp input
sudo apt install -y libinput-tools ruby xdotool wmctrl
sudo gem install fusuma
sudo gem install fusuma-plugin-wmctrl
sudo gem install fusuma-plugin-keypress
mkdir -p ~/.config/fusuma       
touch ~/.config/fusuma/config.yml
cat > ~/.config/fusuma/config.yml << EOF
swipe:
  3:
    left:
      command: 'xdotool key alt+Right' # History forward
    right:
      command: 'xdotool key alt+Left' # History back
    up:
      command: 'xdotool key ctrl+t' # Open new tab
      keypress:
        LEFTSHIFT:
          command: 'xdotool key --clearmodifiers ctrl+shift+t' # Open last closed tab
    down:
      command: 'xdotool key ctrl+w' # Close tab
  4:
    left:
      workspace: 'next' # Switch to next workspace
      keypress:
        LEFTSHIFT: 
          window: 'next' # Move window to next workspace
        LEFTMETA:
          command: 'xdotool key --clearmodifiers super+ctrl+Left' # Move window to left side
    right:
      workspace: 'prev' # Switch to previous workspace
      keypress:
        LEFTSHIFT: 
          window: 'prev' # Move window to previous workspace
        LEFTMETA:
          command: 'xdotool key --clearmodifiers super+ctrl+Right'  # Move window to right side
    up:
      command: 'xdotool key Control_L+F10' # Workspace overview
      keypress:
        LEFTMETA:
          window:
            maximized: 'toggle' # Toggle Maximize/Unmaximize Window
    down:
      command: 'xdotool key Shift_L+Alt_L+Tab' #aaaaa
      keypress:
        LEFTMETA:
          window: 'close' # Close window

pinch:
  2:
    in:
      command: 'xdotool keydown ctrl click 4 keyup ctrl' # Zoom in
    out:
      command: 'xdotool keydown ctrl click 5 keyup ctrl' # Zoom out
  4:
    in:
      command: 'xdotool key super+a' # Window overview
    out:
      command: 'xdotool key super+s' # Workspace overview

rotate:
  3:
    clockwise:
      command: 'xdotool key XF86MonBrightnessUp' # Brightness up
    counterclockwise:
      command: 'xdotool key XF86MonBrightnessDown' # Brightness down

plugin: 
  inputs:
    libinput_command_input: # options for lib/plugin/inputs/libinput_command_input
      enable-tap: true # click to tap
      enable-dwt: true # disable tap while typing
      show-keycodes: true # https://github.com/iberianpig/fusuma-plugin-keypress#add-show-keycode-option
EOF

