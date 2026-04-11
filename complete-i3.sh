#!/bin/sh
sysrc linux_enable="YES"
service linux start
pkg install -y vim git libreoffice doas fastfetch xorg firefox wifibox e2fsprogs xfsprogs exfat-utils fusefs-exfat fusefs-ntfs fusefs-hfsfuse fusefs-lkl fusefs-simple-mtpfs linux_base-rl9
pkg install -y i3 i3status i3lock-color feh dmenu alacritty debootstrap thunar xarchiver thunar-archive-plugin unrar rar zip unzip 7-zip xfce4-clipman-plugin networkmgr xdg-user-dirs picom xclip maim
xdg-user-dirs-update
pw gropmod video -m root
cp ./rc.conf /etc/rc.conf
cp ./loader.conf /boot/loader.conf
cp ./bhyve.conf /usr/local/etc/wifibox/bhyve.conf
cp ./fstab.dk /etc/fstab
mkdir -p /home/demir/.config/
cp -R ./alacritty /home/demir/.config/
cp -R ./i3 /home/demir/.config/
cp -R ./i3status /home/demir/.config/
cp .Xresources /home/demir/.Xresources
cp .xinitrc /home/demir/.xinitrc
mkdir -P /home/demir/Pictures/Screenshots
cp -R ./Wallpapers /home/demir/Pictures/
mkdir -P /compat/debian/
debootstrap trixie /compat/debian http://deb.debian.org/debian/
chown -R demir:demir /home/demir
pkg install -y foreign-cdm chromium
git clone --depth 1 https://git.FreeBSD.org/ports.git /usr/ports
cd /usr/ports/www/linux-widevine-cdm
make install clean
