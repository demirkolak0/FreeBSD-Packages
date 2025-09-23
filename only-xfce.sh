#!/bin/sh
sysrc linux_enable="YES"
service linux start
pkg install -y vim zsh neovim emacs libreoffice sudo fastfetch xorg firefox wifibox linux_base-c7 automount e2fsprogs xfsprogs exfat-utils fusefs-exfat fusefs-ntfs fusefs-hfsfuse fusefs-lkl fusefs-simple-mtpfs
echo 'snd_driver_load="YES"' >> /etc/rc.conf
beep
pw groupmod video -m root
pkg install -y xfce lightdm lightdm-gtk-greeter
echo "proc                    /proc           procfs  rw              0       0" >> /etc/fstab
sysrc dbus_enable="YES"
sysrc lightdm_enable="YES"
