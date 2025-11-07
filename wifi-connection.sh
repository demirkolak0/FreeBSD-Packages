#!/bin/sh
drvslc=""
ssid=""
psk=""
read -p "Are you using native Wireless drivers or wifibox driver?(native/wifibox): " drvslc
read -p "SSID name: " ssid
read -p "Password for the selected network: " psk
if [ $drvslc == native ]; then
	echo 'network={\n	ssid="$ssid"\n	scan_ssid=1\n	psk="$psk"\n	priority=5\n}' >> /etc/wpa_supplicant.conf
elif [ $drvslc == wifibox ]; then
	echo 'network={\n	ssid="$ssid"\n	scan_ssid=1\n	psk="$psk"\n	priority=5\n}' >> /usr/local/etc/wifibox/wpa_supplicant/wpa_supplicant.conf
else
	echo "Unknown selection. Please re-run the script."
fi