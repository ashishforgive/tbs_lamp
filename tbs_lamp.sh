#!/bin/bash
# Author : Ashish Kumar
# Copyright (c) TechBrise.com

#Color script
red=`tput setaf 1`
green=`tput setaf 2`
yellwo=`tput setaf 3`
echo "${green} +++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "${green}| Hola!! you are installing the LAMP using TechBrise LAMP.|
| 	L- Linux					  |
| 	A- Aapache2 					  |
| 	M- MYSQL 					  |
| 	P- PHP						  |
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo 
echo "${yellwo}Are you sure? you want to install LAMP in your machine if yes please press Y/y elase press N/n key for decline."
echo -n "Please press [Y][N]:"; read -r  acceptance
if [ $acceptance == Y -o $acceptance == y ]
then
	echo "Hurry!! Your installation is being started. It will take long have a cup of tea and Enjoy!!........."
# Update Package Index
sudo apt update
echo "${green}Update completed!!"
# Install Apache2, MySQL, PHP
echo "${green}Installing Apache2, MySQL, PHP....."
 sudo apt install apache2 mysql-server php php-mysql libapache2-mod-php php-cli
echo "${green}Completed!!."

# Allow to run Apache on boot up
echo "${green}Allowing to run Apache on boot up"
 sudo systemctl enable apache2

# Restart Apache Web Server
echo "${green}Restarting Apache2..."
 sudo systemctl start apache2

# Adjust Firewall
echo "${green}Adjusting Firewall..."
 sudo ufw allow "Apache Full"

# Allow Read/Write for Owner
echo "${green}Allowing Read/Write permission..."
 sudo chmod -R 0755 /var/www/html/

# Create info.php for testing php processing
echo "${green}Creating info files for test php..."
 sudo echo "<?php phpinfo(); ?>" > /var/www/html/info.php

# Open localhost in the default browser
echo "${green}Opening browser for test......."
 xdg-open "http://localhost"
 xdg-open "http://localhost/info.php"
else
	echo "You have terminated the installations"
fi
