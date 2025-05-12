#!/bin/sh
uname=""
a=""
b=""
de=""
kboardlang=""
read -p "Please enter your username: " uname
pkg install xorg vim neovim emacs libreoffice
echo 'snd_driver_load="YES"' >> /etc/rc.conf
beep
echo 'sysrc linux_enable="YES"' >> /etc/rc.conf
service linux start
read -p "You should set up userland for Linux yourself. Enter to continue." b
pw groupmod video -m $uname
pw groupmod video -m root
read -p "You should set up graphic drivers yourself. Enter to continue." a
read -p "Please select your Desktop Environment(XFCE, KDE, GNOME, MATE, Cinnamon, LXQT)"
if [ $de == "XFCE" ]; then
	pkg install xfce lightdm lightdm-gtk-greeter firefox
	echo "proc                    /proc           procfs  rw              0       0" >> /etc/fstab
	echo 'sysrc dbus_enable="YES"' >> /etc/rc.conf
	echo 'sysrc lightdm_enable="YES"' >> /etc/rc.conf
elif [ $de == "KDE" ]; then
	pkg install kde sddm firefox
	echo 'sysrc dbus_enable="YES"' >> /etc/rc.conf
	echo 'sysrc sddm_enable="YES"' >> /etc/rc.conf
	read -p "Your default keyboard language will be english. If you want to change it please enter the language. For exp. for english please enter en_US" $kboardlang
	sysrc sddm_lang="$kboardlang"
elif [ $de == "GNOME" ]; then
	pkg install gnome firefox
	echo "proc                    /proc           procfs  rw              0       0" >> /etc/fstab
	echo 'sysrc dbus_enable="YES"' >> /etc/rc.conf
        echo 'sysrc gdm_enable="YES"' >> /etc/rc.conf
elif [ $de == "MATE" ]; then
	pkg install mate lightdm lightdm-gtk-greeter firefox
	echo "proc                    /proc           procfs  rw              0       0" >> /etc/fstab
        echo 'sysrc dbus_enable="YES"' >> /etc/rc.conf
	echo 'sysrc lightdm_enable="YES"' >> /etc/rc.conf
elif [ $de == "Cinnamon" ]; then
	pkg install cinnamon lightdm lightdm-gtk-greeter firefox
	echo "proc                    /proc           procfs  rw              0       0" >> /etc/fstab
        echo 'sysrc dbus_enable="YES"' >> /etc/rc.conf
        echo 'sysrc lightdm_enable="YES"' >> /etc/rc.conf
elif [ $de == "LXQT" ]; then
	pkg install lxqt sddm firefox
	echo "proc                    /proc           procfs  rw              0       0" >> /etc/fstab
        echo 'sysrc dbus_enable="YES"' >> /etc/rc.conf
	echo 'sysrc sddm_enable="YES"' >> /etc/rc.conf
	read -p "Your default keyboard language will be english. If you want to change it please enter the language. For exp. for english please enter en_US" $kboardlang
        sysrc sddm_lang="$kboardlang"
else
	echo "You entered a wrong name. There will be no Desktop Environments."
fi

