# Working with Bash Scripting
### Linux Bash Scripts
-A script is an executable file that contains a set of commands to accomplish a specific task. More, importantly, bash scripts are very important for IT professionals because with scripts we can automate most of the manual Linux system tasks.

#### Software installation
--If you already have a Linux VM running that's great; you can start running the scripts below.
--If you need to create a new Linux VM on your local machine, just follow the simple steps below.
-Creating a new VM
-Create a directory on your machine
--Command: $ mkdir centos_dir
--Command: $ cd centos_dir
--Command: $ vagrant init generic/centos7
-Now start your centos7 VM
--Command: $ vagrant up
-Once the installation is done: Now you can start working with the scripts
--Again, I am working with a centos7 Linux machine

### Creating Bash Scripts
#### Folder: Simple_Scripts
##### Files: IP_show
This script shows the networking information (IP address) of your machine:
-Let's create the script
--Command:$ touch IP_show.sh
--Command:$ vi IP_show.sh
-Copy the content of my script and paste it into your file.
-Let's explore the content of the file.
--I started the file with some useful information for the reader. It's a good practice to state the author, date, and description in the script.
-- #!/bin/bash : This command is very important because without the script wouldn't execute.
--I used variables in this script to hold some of my values.
-- value=$(ip addr show) : Assigning value to the ip addr show results
-Once you save the script: now give the file the execution permissions
--Command: $ chmod +x IP_show.sh
-Run the script
--Command: $ ./IP_show.sh
-Now, you can see your environment's IP address.

##### Files: Simple_while
This is a simple while loop that counts values until it reaches the number ten. While loop can be helpful when you need to loop through a big file.
-Follow the above step of creating a script file and content of my script and paste it into your file.
-Explore the file content:
--Command: while [$counter -lt 10]  : Here, I am setting a condition that allows the script to keep running until it reaches 10 and exits. $counter is a variable that I define in the scripts.
-Always remember to give execution permission to the script file, with this command:
--Command: $ chmod +x script_file_name
-Run the script file and see the results
##### Files: creating_multiple_users
This script creates multiple users at once on your system.
-Creating multiple users manually can take time and you probably going to make some type of a mistake during the process. This script can save IT administrators time and make sure the right users were created.
-Follow the above steps of creating a script file.
-Explore the script content to better understand the concepts because I used a for loop to create the scripts.
--Command: for i in andrew john david u9bt; this command allows me to iterate through the usernames
--Command: useradd ${i} : every user that gets iterated through make sure to create them in my system.
--Command: sleep 3  : This delay the screen output by 3 seconds for each iteration.
-Give executable permission to the script file and run it.
-Check the newer create users by running this command:
--Command: # tail -10 /etc/passwd
-Now, you can see the new users.

#### Folder: Centos7_Web_Setup_Script
##### Files: websetup_Centos7
This script is going to deploy a static website by automating the manual process that takes to deploy a static website on a centos7 machine.
--Let's create a script in our user home directory.
--Command:$ cd ~
--Command:$ touch website.sh
--Command:$ vi website.sh
-Copy the contents of my script and paste it into your file. Now, let's explore the script.
--Command: sudo yum install wget unzip httpd -y > /dev/null  : This command installs all the required packages and the -y option keeps the script from asking us questions about some package dependencies. I also redirect the output of this command to the /dev/null directory.
-Once all the packages are installed, we need to start and enable the httpd webserver daemon.
-Because we are getting our website source code from the internet, we need to create a temporary directory in our /tmp directory.
--Command: mkdir -p /tmp/webfiles
-After getting the source code, we need to restart the httpd daemon.
-Once everything is done, the script is going to show the location of the website artifact.
-Now, run the command to show the machine IP address and use the IP address to access the website from the browser.
--Command: $ ip addr show
-Now, you can see the static website.

##### Files: Variable_Centos7_websetup
These scripts do the same thing as the websetup_Centos7.sh file by deploying a static website, but in this script, I used variables and assigned repeating values to variables. It's a good practice to use variables in scripts because the script can be easy to modify.
-Compare both files and see the different formatting that I used to accomplish the same task of deploying a static website.

##### Files: multi_env_OS
This script can deploy a static website on two different Linux flavor machines (Ubuntu and Centos7). Sometimes, we might want to deploy an application on different Linux flavor machines, and to save time; we need to create a script that can run on both machines.
-I used an if statement to accomplish the process because I wanted to make sure I was able to install the required packages for each machine.
--Command: apt --help
           if [$? -eq 0]
           then
             code here
           else:
            code here
-First, I am checking the system by running the command "apt --help" to see if I am working with an Ubuntu system and if the output code is zero then execute the code for the ubuntu system.
-Else, if the output code is not zero then execute the code for the centos7 system.
-Now, you can run the script on either Ubuntu or Centos7 system and still achieve the same results.
