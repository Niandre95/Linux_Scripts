# Author: Andrew Bienvenue


# Description: Creating multiple users using the for loop


#!/bin/bash
for i in andrew john david u9bt;
do
useradd ${i}
echo "user $i is successfully created"
sleep 3
done
