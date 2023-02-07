#Author: Andrew Bienvenue
#Date: 10/15/2020

# I am going to deploy a static website using a centos7 linux machine


#!/bin/bash

# Installing Dependencies
echo "Installing the system packages."
echo
sudo yum install wget unzip httpd -y > /dev/null
echo

# Start & Enable Service
echo "Start & Enable HTTPD Service for the system"
echo 
sudo systemctl start httpd
sudo systemctl enable httpd
echo

# Creating Temp Directory
echo "Artifact Deployment"
echo 
mkdir -p /tmp/webfiles
cd /tmp/webfiles
echo

wget https://www.tooplate.com/zip-templates/2129_crispy_kitchen.zip > /dev/null
unzip 2129_crispy_kitchen.zip > /dev/null
sudo cp -r 2129_crispy_kitchen/* /var/www/html/
echo

# Bounce Service
echo "Restarting HTTPD service"
echo
systemctl restart httpd
echo

# Clean Up
echo "Removing Temporary Files"
echo 
rm -rf /tmp/webfiles
echo

sudo systemctl status httpd
ls /var/www/html/
