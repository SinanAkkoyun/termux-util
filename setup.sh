#ubuntu-fs/root/
#!/bin/bash
apt update
apt upgrade -y
apt dist-upgrade -y
apt install openssh-server python3 python3-pip blender vim tmux apache2 -y
#vnc

add-apt-repository ppa:openjdk-r/ppa
apt update
apt install openjdk-8-jdk -y
