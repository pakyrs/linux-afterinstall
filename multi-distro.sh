#!/bin/bash
declare -A osInfo;
osInfo[/etc/debian_version]="apt install -y"
osInfo[/etc/alpine-release]="apk --update add"
osInfo[/etc/centos-release]="yum install -y"
osInfo[/etc/fedora-release]="dnf install -y"
osInfo[/etc/arch-release]="pacman -S --noconfirm"

for f in ${!osInfo[@]}
do
    if [[ -f $f ]];then
        package_manager=${osInfo[$f]}
    fi
done

package="git"
package="git"
       - vlc
       - bleachbit
       - cheese
       - cmatrix
       - curl
       - figlet
       - filezilla
       - flameshot
       - fontconfig
       - gimp
       - git
       - gnupg
       - gparted
       - guake
       - htop
       - iftop
       - inkscape
       - ipcalc
       - iperf
       - kitty
       - keepassxc
       - plank
       - lshw
       - meld
       - mtr
       - mosh
       - ncdu
       - neofetch
       - net-tools
       - nmap
       - p7zip
       - powerline
       - pwgen
       - qbittorrent
       - ranger
       - redshift
       - remmina
       - screen
       - scribus
       - shotwell
       - speedtest-cli
       - sshuttle
       - telnet
       - tldr
       - tmate
       - tmux
       - tree
       - vim
       - virt-manager
       - wget
       - wine
       - zsh

${package_manager} ${package}
