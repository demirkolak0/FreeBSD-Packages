#!/bin/sh
sysrc linux_enable="YES"
service linux start
pkg install -y wayland seatd vim zsh libreoffice doas fastfetch xorg firefox wifibox e2fsprogs xfsprogs exfat-utils fusefs-exfat fusefs-ntfs fusefs-hfsfuse fusefs-lkl fusefs-simple-mtpfs
echo 'snd_driver_load="YES"' >> /etc/rc.conf
beep
pw groupmod video -m root
pkg install -y kde sddm
pw groupadd seatd
pw groupmod seatd -m root
pw groupmod seatd -m demir
sysrc dbus_enable="YES"
sysrc seatd_enable="YES"
sysrc sddm_enable="YES"
sysrc sddm_lang="en_GB"
