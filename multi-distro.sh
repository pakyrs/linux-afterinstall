#!/bin/bash

# package install
declare -A osInfo;
osInfo[/etc/debian_version]="apt install -y"
osInfo[/etc/alpine-release]="apk --update add"
osInfo[/etc/centos-release]="yum install -y"
osInfo[/etc/fedora-release]="dnf install -y"
osInfo[/etc/arch-release]="pacman -S --noconfirm"

for f in ${!osInfo[@]}
do
    if [[ -f $f ]];then
        package_install=${osInfo[$f]}
    fi
done

# package update
declare -A osInfo1;
osInfo1[/etc/debian_version]="apt update -y"
osInfo1[/etc/alpine-release]="apk --update "
osInfo1[/etc/centos-release]="yum update -y"
osInfo1[/etc/fedora-release]="dnf update -y"
osInfo1[/etc/arch-release]="pacman -Sy --noconfirm"

for f in ${!osInfo1[@]}
do
    if [[ -f $f ]];then
        package_update=${osInfo1[$f]}
    fi
done

# generic package list
package="git"
package="vim"
package="cheese"
package="cmatrix"
package="curl"
package="figlet"
package="fontconfig"
package="gnupg"
package="htop"
package="iftop"
package="ipcalc"
package="iperf"
package="lshw"
package="mtr"
package="mosh"
package="ncdu"
package="neofetch"
package="net-tools"
package="nmap"
package="p7zip"
package="powerline"
package="pwgen"
package="ranger"
package="screen"
package="speedtest-cli"
package="sshuttle"
package="telnet"
package="tldr"
package="tmate"
package="tmux"
package="tree"
package="wget"
package="zsh"

#package="gimp"
#package="guake"
#package="meld"
#package="vlc"
#package="bleachbit"
#package="wine"
#package="virt-manager"
#package="scribus"
#package="shotwell"
#package="redshift"
#package="remmina"
#package="qbittorrent"
#package="tabby"
#package="keepassxc"
#package="filezilla"
#package="flameshot"
#package="gparted"
#package="inkscape"

${package_update}
${package_install} ${package}
