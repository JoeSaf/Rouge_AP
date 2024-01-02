#!/bin/bash

echo "Installing some requirements"
sudo apt install -y xterm
echo "Do you have bridge-utils(y/n)? "
read choice


case "$choice" in
  n)
        echo "Installing bridge utils"
        sudo apt install -y bridge-utils
;;
  y)
        echo "proceeding" 
;;
  *)
        echo "Invalid choice."
;;
esac

echo "This is a Rouge_AP creator,"
echo "Jus follow the steps "
echo "---------------------------"
echo "|                         |"
echo "|  +++               +++  |"
echo "*****No turning, back******"
echo "|                         |"
echo "|                         |"
echo "---------ROUGE_AP----------"

echo "Do you know your monitor interface name(y/n)?"
read reading


case "$reading" in 
 n) 
	echo "Read the name of your wireless interface, and write it down:"
	echo "When done, press 'Ctrl+c'."
	sudo  xterm -e iwconfig
	echo "Type in your interface name:"
	read wlan_name
	echo "Proceeding..."
	#starting monitor mode
	echo "starting monitor mode;;;;;;;;;;"
	sudo airmon-ng check kill
	sudo airmon-ng start $wlan_name
;;
 y)
	echo "Proceeding...."
	echo "Enter your wireless card name:"
	read wlan0_name
	echo "Proceeding..."
	 #starting monitor mode
        echo "starting monitor mode;;;;;;;;;;"
        sudo airmon-ng check kill
        sudo airmon-ng start $wlan0_name
;;


 *) 
	echo "Invalid choice..."

esac

#to check monitor interface name
echo "Your monitor interface name will be displayed below"
xterm -e iwconfig
echo "Enter your monitor interface below:"
read wlan_moni

echo "Do you want to create your own Rouge_AP or mimick a WiFi,"
echo "if you want to create your own ,enter == 'y',if you want to mimick enter == n "
read Rouge
case "$Rouge" in 
 y)
	echo "I see you have chosen to go wild,"
	echo "well.....enjoy your creation,,,,,,"
	echo "wait abit.....we gotta create a few things first.."
	echo "Do you have bridge-utils,(enter='yes/no')"
	read Installer
	
	case "$Installer" in 
	no)
		echo "I'm gonna install bridge utils for ya;;;;;"
		sudo apt-get install bridge-utils
	;;
	yes)
		echo "Enter name for your Rouge_AP:"
		read Rouge_name
		echo "Enter channel nom.:"
		read Rouge_channel_nom
		echo "Creating................"
		sudo airbase-ng --essid $Rouge_name -c $Rouge_channel_nom $wlan_moni
	;;
	*)
		echo "Invalid choice..'''.."
		
	esac

;;
 *)
		echo "Invalid choice...."

esac		

