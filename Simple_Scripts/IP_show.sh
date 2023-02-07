# Author: Andrew Bienvenue
# Date: 10/08/2022

# This script shows the IP address of the working machine


#!/bin/bash

value=$(ip addr show)

# showing the server IP address

echo "The Network information is below"
echo "################################"
echo $value