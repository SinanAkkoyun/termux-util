#termux-util/

WARNING: THIS REPO IS OUTDATED AND COULD BRICK YOUR TERMUX OR CAUSE DAMAGE
Refactor as you need and PR if you want lel

all scripts that make life easier

execute this:

rm -rf termux-util; git clone https://github.com/SinanAkkoyun/termux-util && chmod +x termux-util/termux-app/install.sh && ./termux-util/termux-app/install.sh

if you only want to patch your binaries to your existing ubuntu-fs, do:
./termux-util/termux-app/install.sh -p
