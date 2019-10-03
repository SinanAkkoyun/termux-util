#ubuntu-fs/root/
cd /usr/local                                                                                   rm -r blender-2.80-linux-glibc217-x86_64                                                        wget https://ftp.halifax.rwth-aachen.de/blender/release/Blender2.80/blender-2.80-linux-glibc217-x86_64.tar.bz2
mkdir blender
tar xjf blender-2.80* -C blender
mv blender/blender-2.80-linux-glibc217-x86_64/* blender/
rm blender-2.80-linux-glibc217-x86_64.tar.bz2
rm -r blender/blender-2.80*
cd
echo "Installation of Blender 2.80 done!"
