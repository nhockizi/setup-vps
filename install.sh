#!/bin/bash
# ******************************************
# Program: Script auto connect aws
# Developer: NhocKizi
# Date: 07/07/2017
# ******************************************

echo "###################################################################################"
echo "Please be Patient: Installation will start now.......and it will take some time :)"
echo "###################################################################################"

dist=`grep DISTRIB_ID /etc/*-release | awk -F '=' '{print $2}'`

if [ "$dist" == "Ubuntu" ]; then
	sudo apt-get install software-properties-common
	sudo add-apt-repository ppa:ondrej/php
    sudo apt-get update

    #Apache, Php, MySQL and required packages installation
    sudo apt-get -y install nginx curl php-fpm php-mbstring php-xml php-mysql php-common php-gd php-json php-cli php-curl

    #The following commands set the MySQL root password to 123123 when you install the mysql-server package.
    sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password 123123'
    sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password 123123'
    sudo apt-get -y install mysql-server

    sudo chmod 755 -R /var/www/
else
    echo "not ubuntu"
fi
