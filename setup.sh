#ubuntu-fs/root/
#!/bin/bash
apt update
apt upgrade -y
apt dist-upgrade -y
apt install openssh-server python3 python3-pip blender vim tmux apache2 -y
#vnc

add-apt-repository ppa:openjdk-r/ppa
apt update
apt install openjdk-8-jdk curl -y

mkdir ~/Minecraft && cd ~/Minecraft && wget https://www.dropbox.com/s/awi0eczcq2645sc/setupMC1_14_4.sh && chmod +x setupMC1_14_4.sh
sed -i 's/sudo//g' setupMC1_14_4.sh
./setupMC1_14_4.sh
