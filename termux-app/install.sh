#!/data/data/com.termux/files/usr/bin/bash

wget http://www.mediafire.com/file/e3efgtqmrab3nf2/kde_ubuntu.tar.gz/file
pkg update
pkg install proot -y && pkg install openssh -y && pkg install tar -y && pkg install nano -y
echo " "
echo " "
echo "-----------------------------------------------------------"
echo " "
echo "|  NOTE THAT ALL THE PREVIOUS UBUNTU DATA WILL BE ERASED  |"
echo " "
echo "---------------------------------------------------------- "
echo " "
echo " "
echo  "Allow the Storage permission to termux"
echo " "
termux-setup-storage
sleep 7

cd
echo "Allowing permission to files"
chmod +x kde_ubuntu.tar.gz
echo " "

echo "Verifying MD5 Checksum "
echo " "
echo "ORIGINAL FILE CHECKSUM::"
echo " "
echo "5bfc3ba6dcfec7abb0420b613f8acc0e  kde_ubuntu.tar.gz "
echo " "
echo " "
echo "DOWNLOADED FILE CHECKSUM::"
echo " "
echo "$(md5sum kde_ubuntu.tar.gz)"
echo " "
echo "IF BOTH CHECKSUMS DON'T MATCH CONTACT SUPPORT"
echo " "
echo " "

echo "Extracting tar files"
tar xf kde_ubuntu.tar.gz

echo "Checking for file integrity"

FILE=start-ubuntu.sh
if test -f "$FILE"; then
    echo "Boot script present"
    echo " "
fi

FD=ubuntu-fs
if [ -d "$FD" ]; then
  echo "Boot container present...Files unchecked"
  echo " "
fi

UFD=ubuntu-binds
if [ -d "$UFD" ]; then
  echo "Sub-Boot container present"
fi

echo "Applying Patches"
rm -rf ubuntu-fs/root/.vnc/passwd
rm -rf ubuntu-fs/usr/local/bin/vncserver-start
rm -rf ubuntu-fs/usr/local/bin/vncserver-stop

wget https://raw.githubusercontent.com/Techriz/AndronixOrigin/master/Installer/KDE/vncserver-stop -P ubuntu-fs/usr/local/bin && chmod +x ubuntu-fs/usr/local/bin/vncserver-stop
wget https://raw.githubusercontent.com/Techriz/AndronixOrigin/master/APT/LXDE/vncserver-start -P ubuntu-fs/usr/local/bin/ && chmod +x ubuntu-fs/usr/local/bin/vncserver-start


rm -rf termux-util
git clone https://github.com/SinanAkkoyun/termux-util/

for file in termux-util/*
do
    if [ ! -d $file ]
    then
        dest="$(head -n 1 $file | cut -d "#" -f 2)"
        if [ "$(cut -c 1 <<< "$dest")" != "!" ]
        then
            chmod +x $file
            mkdir $dest
            mv $file $dest
            echo "Moved $file to $dest."
        fi
    fi
done
