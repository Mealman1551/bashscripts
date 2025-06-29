sudo apt update && upgrade -y

sudo apt install curl wget git build-essential cmake libboost-dev libboost-thread-dev libboost-system-dev liblua5.2-dev libssl-dev libcurl4-openssl-dev libusb-dev zlib1g-dev -y


cd ~/Downloads
wget http://security.debian.org/debian-security/pool/updates/main/o/openssl/libssl1.1_1.1.1w-0+deb11u3_amd64.deb
sudo dpkg -i libssl1.1_1.1.1w-0+deb11u3_amd64.deb
sudo apt --fix-broken install

curl -L https://install.domoticz.com | bash

