# Author: Andrew Bienvenue
# Date: 10/02/2022

# A simple while loop that keeps track of the count

#!/bin/bash

counter=0

while [ $counter -lt 10 ]
do
  echo "The count is going up......"
  echo "Value of counter is $counter."
  counter=$(( $counter + 1 ))
  sleep 2
done

echo "You reach the highest number in the loop"
