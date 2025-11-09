#!/bin/sh
sysrc linux_enable="YES"
kldload linux linux64
pkg install -y linux_base-rl9 linux-rl9-pulseaudio-libs linux-rl9-pulseaudio-utils
mkdir -p /compat/linux/proc
mkdir -p /compat/linux/sys
mkdir -p /compat/linux/dev
mount -t linprocfs linproc /compat/linux/proc
mount -t linsysfs linsys /compat/linux/sys
mount -t devfs devfs /compat/linux/dev
echo "linproc                 /compat/linux/proc procfs rw            0       0" >> /etc/fstab
echo "linsys                  /compat/linux/sys linsysfs rw           0       0" >> /etc/fstab
echo "devfs                   /compat/linux/dev devfs rw              0       0" >> /etc/fstab
