#!/bin/sh
uname=""
a=""
de=""
kboardlang=""
read -p "Please enter your username: " uname
pkg install -y vim neovim emacs libreoffice sudo neofetch
pkg install -y xorg
echo 'snd_driver_load="YES"' >> /etc/rc.conf
beep
pw groupmod video -m $uname
pw groupmod video -m root
read -p "You should set up graphic drivers yourself. Enter to continue." a
read -p "Please select your Desktop Environment(XFCE, KDE, GNOME, MATE, Cinnamon, LXQT): " de
if [ $de == "XFCE" ]; then
	pkg install -y xfce lightdm lightdm-gtk-greeter
	echo "proc                    /proc           procfs  rw              0       0" >> /etc/fstab
	sysrc dbus_enable="YES"
	sysrc lightdm_enable="YES"
elif [ $de == "KDE" ]; then
	pkg install -y kde sddm
	sysrc dbus_enable="YES"
	sysrc sddm_enable="YES"
	read -p "Your default keyboard language will be english. If you want to change it please enter the language. (For exp. for english please enter en_US): " $kboardlang
	sysrc sddm_lang="$kboardlang"
elif [ $de == "GNOME" ]; then
	pkg install -y gnome
	echo "proc                    /proc           procfs  rw              0       0" >> /etc/fstab
	sysrc dbus_enable="YES"
        sysrc gdm_enable="YES"
elif [ $de == "MATE" ]; then
	pkg install -y mate lightdm lightdm-gtk-greeter
	echo "proc                    /proc           procfs  rw              0       0" >> /etc/fstab
        sysrc dbus_enable="YES"
	sysrc lightdm_enable="YES"
elif [ $de == "Cinnamon" ]; then
	pkg install -y cinnamon lightdm lightdm-gtk-greeter
	echo "proc                    /proc           procfs  rw              0       0" >> /etc/fstab
        sysrc dbus_enable="YES"
        sysrc lightdm_enable="YES"
elif [ $de == "LXQT" ]; then
	pkg install -y lxqt sddm
	echo "proc                    /proc           procfs  rw              0       0" >> /etc/fstab
        sysrc dbus_enable="YES"
	sysrc sddm_enable="YES"
	read -p "Your default keyboard language will be english. If you want to change it please enter the language. (For exp. for english please enter en_US.) :" $kboardlang
        sysrc sddm_lang="$kboardlang"
else
	echo "You entered a wrong name. There will be no Desktop Environments."
fi

