#!/bin/bash

apt update
apt-get update
apt install dconf-editor
apt-get install sed
echo -e "\e[0;31mdconf-editor vient d'être installé.\e[1;37m"

echo -e "\e[0;31mVous allez devoir créer le mot de passe de l'utilisateur 'kiosk'.\e[1;37m"

adduser kiosk

if [ "id -u kiosk" != 0 ]
then
	echo -e "\e[0;31mL'utilisateur 'kiosk' vient d'être créé.\e[1;37m"
else
	echo -e "\e[0;31mErreur: l'utilisateur 'kiosk' N'a PAS été créé.\e[1;37m"
fi
sleep 2

echo -e "\e[0;31mL'ordinateur va redémarrer dans 5s...\e[1;37m"
sleep 1

echo -e "\e[0;31mL'ordinateur va redémarrer dans 4s...\e[1;37m"
sleep 1

echo -e "\e[0;31mL'ordinateur va redémarrer dans 3s...\e[1;37m"
sleep 1

echo -e "\e[0;31mL'ordinateur va redémarrer dans 2s...\e[1;37m"
sleep 1

echo -e "\e[0;31mL'ordinateur va redémarrer dans 1s...\e[1;37m"
sleep 1

reboot
