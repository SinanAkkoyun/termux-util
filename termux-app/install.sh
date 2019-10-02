#.
#!/data/data/com.termux/files/usr/bin/bash
cd
if [ "$1" != "-p" ]
then
if [ ! -f kde_ubuntu.tar.gz ]
then
    if [ "5bfc3ba6dcfec7abb0420b613f8acc0e" != "$(md5sum kde_ubuntu.tar.gz)" ]
    then
        rm -rf kde_ubuntu.tar.gz
        wget -O kde_ubuntu.tar.gz http://www.mediafire.com/file/e3efgtqmrab3nf2/kde_ubuntu.tar.gz/file
    fi
fi
pkg update
pkg install proot -y && pkg install openssh -y && pkg install tar -y && pkg install nano -y && pkg install git -y
cd
echo "Allowing permission to files"
chmod +x kde_ubuntu.tar.gz
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
fi

rm -rf termux-util
git clone https://github.com/SinanAkkoyun/termux-util/

for file in termux-util/[^.]*
do
    if [ ! -d $file ]
    then
        dest="$(head -n 1 $file | cut -d "#" -f 2)"
        if [ "$(cut -c 1 <<< "$dest")" != "!" ]
        then
            chmod +x $file
            rm -rf $file 2>/dev/null
            mkdir $dest 2>/dev/null
            mv $file $dest
            echo "Moved $file to $dest."
        fi
    fi
done

for file in termux-util/termux-app/[^.]*
    if [ ! -d $file ]
    then
        dest="$(head -n 1 $file | cut -d "#" -f 2)"
        if [ "$(cut -c 1 <<< "$dest")" != "!" ]
        then
            chmod +x $file
            rm -rf $file 2>/dev/null
            mkdir $dest 2>/dev/null
            mv $file $dest
            echo "Moved $file to $dest."
        fi
    fi
done

echo "Done! ./start-ubuntu.sh to log into linux!"
