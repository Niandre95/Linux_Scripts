#Author: Andrew Bienvenue
#Date: 10/15/2020

# I am going to be using variable in the script to deploy a static website.


#!/bin/bash

# Variable Declaration for easy access
PACKAGES="httpd wget unzip"
Webserver="httpd"
URL='https://templatemo.com/tm-zip-files-2020/templatemo_522_venue.zip'
Artifact='templatemo_522_venue'
Tempfile="/tmp/webfiles"

# Installing Dependencies
echo "Installing packages."
echo
sudo yum install $PACKAGES -y > /dev/null
echo

# Start & Enable Service the web server
echo "Start & Enable HTTPD Service for the environment"
echo
sudo systemctl start $Webserver
sudo systemctl enable $Webserver
echo

# Creating Temp Directory to store the artifact files
echo "Starting Artifact Deployment"
echo
mkdir -p $Tempfile
cd $Tempfile
echo

wget $URL > /dev/null
unzip $Artifact.zip > /dev/null
sudo cp -r $Artifact/* /var/www/html/
echo

# Starting Service
echo "Restarting HTTPD service for the environment"
echo 
systemctl restart $Webserver
echo

# Clean Up
echo "Removing Temporary Files from the system"
echo 
rm -rf $Tempfile
echo

sudo systemctl status $Webserver
ls /var/www/html/
