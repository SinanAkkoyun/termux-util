#ubuntu-fs/root/
#!/bin/bash
apt update
apt upgrade -y
apt dist-upgrade -y
apt install openssh-server apache2 tmux apache2 -y
#vnc
