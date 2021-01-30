# linux_apps
Automation script for linux after install

apt update && apt upgrade -y

apt install git

cd ~/Downloads

git clone https://github.com/pakyrs/linux_apps

cd linux_apps

sudo chmod +x ubuntu.sh

./ubuntu.sh 2> errors.txt
