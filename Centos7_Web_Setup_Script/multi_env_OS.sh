#Author: Andrew Bienvenue
#Date: 10/20/2022

#The script deploy a static web site for either Ubuntu or CentOS server

#!/bin/bash

URL='https://www.tooplate.com/zip-templates/2088_big_city.zip'
ArtifactFile='2088_big_city'
Tempfile="/tmp/webfiles"

apt --help &> /dev/null

if [ $? -eq 0 ]
then

    PACKAGES="apache2 wget unzip"
    Server="apache2"

    echo "Running Setup on Ubuntu"
    # Installing Dependencies
    echo
    echo "Installing packages."
    echo 
    sudo apt update
    sudo apt install $PACKAGES -y > /dev/null
    echo

    # Start & Enable Service
    echo "Start & Enable Apache2 Service"
    echo
    sudo systemctl start $Server
    sudo systemctl enable $Server
    echo

    # Creating Temp Directory
    echo "Starting Artifact Deployment"
    echo
    mkdir -p $Tempfile
    cd $Tempfile
    echo

    wget $URL > /dev/null
    unzip $ArtifactFile.zip > /dev/null
    sudo cp -r $ArtifactFile/* /var/www/html/
    echo

    # Bounce Service
    echo "Restarting Apache2 service"
    echo
    systemctl restart $Server
    echo

    # Clean Up
    echo "Removing Temporary Files from the directory"
    echo
    rm -rf $Tempfile
    echo

    sudo systemctl status $Server
    ls /var/www/html/

else

    # Set Variables for CentOS
   PACKAGES="httpd wget unzip"
   Server="httpd"

   echo "Running Setup on CentOS"
   # Installing Dependencies
   echo "Installing packages."
   echo 
   sudo yum install $PACKAGES -y > /dev/null
   echo

   # Start & Enable Service
   echo "Start & Enable HTTPD Service"
   echo
   sudo systemctl start $Server
   sudo systemctl enable $Server
   echo

   # Creating Temp Directory
   echo "Starting Artifact Deployment"
   echo
   mkdir -p $Tempfile
   cd $Tempfile
   echo

   wget $URL > /dev/null
   unzip $ArtifactFile.zip > /dev/null
   sudo cp -r $ArtifactFile/* /var/www/html/
   echo

   # Bounce Service
   echo "Restarting HTTPD service"
   echo
   systemctl restart $Server
   echo

   # Clean Up
   echo "Removing Temporary Files"
   echo
   rm -rf $Tempfile
   echo

   sudo systemctl status $Server
   ls /var/www/html/
fi