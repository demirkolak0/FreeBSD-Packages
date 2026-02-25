#!/bin/sh
sysrc linux_enable="YES"
service linux start
pkg install -y vim zsh libreoffice doas fastfetch xorg firefox wifibox e2fsprogs xfsprogs exfat-utils fusefs-exfat fusefs-ntfs fusefs-hfsfuse fusefs-lkl fusefs-simple-mtpfs
echo 'snd_driver_load="YES"' >> /etc/rc.conf
beep
pw groupmod video -m root
pkg install -y kde sddm
sysrc dbus_enable="YES"
sysrc sddm_enable="YES"
sysrc sddm_lang="en_US"

