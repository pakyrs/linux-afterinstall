# linux_apps
Automation script for linux after install

sudo apt update && sudo apt upgrade -y && sudo apt install git -y

cd ~/Downloads

git clone https://github.com/pakyrs/linux_apps

cd linux_apps

sudo chmod +x ubuntu.sh

./ubuntu.sh 2> errors.txt




Zsys garbace collection

git clone https://github.com/ubuntu/zsys

sudo cp ~/Downloads/zsys/internal/config/zsys.conf /etc/

sudo zsysctl service reload

https://discourse.ubuntu.com/t/zfs-focus-on-ubuntu-20-04-lts-blog-posts/16355

