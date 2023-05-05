#!/bin/bash
####################################
sudo apt update 1> /dev/null 

if [ $? -eq 0 ];then
   echo "############################## repository updated ######################"
else
   echo "############################## Failed to update repository ###################"
fi
#####################################
sudo apt install openjdk-11-jdk -y 1> /dev/null
if [ $? -eq 0 ];then
   echo "################## openjdk-11-jdk -y installed ####################"
else
   echo "################## Failed to install openjdk-11-jdk ##############################"
fi
###################################
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -  1> /dev/null

if [ $? -eq 0 ];then
   echo "################## GPG key imported ####################"
else
   echo "################## Failed to import GPG key ##############################"
fi

###################################
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list' 1> /dev/null

if [ $? -eq 0 ];then
   echo "################## jenkins repositry added ####################"
else
   echo "################## Failed to add jenkins repositroy ##############################"
fi
##################################
sudo apt update 1> /dev/null 

if [ $? -eq 0 ];then
   echo "############################## repository updated ######################"
else
   echo "############################## Failed to update repository ###################"
fi
#####################################
sudo apt install jenkins -y 1> /dev/null | pv

if [ $? -eq 0 ];then
   echo "############################## jenkins installed ######################"
else
   echo "############################## Failed to install jenkins ###################"
fi
#############################################

sudo systemctl enable jenkins 1> /dev/null

if [ $? -eq 0 ];then
   echo "############################## jenkins enabled ######################"
else
   echo "############################## Failed to enable jenkins ###################"
fi
###########################################
sudo systemctl enable ufw 1> /dev/null
if [ $? -eq 0 ];then
   echo "############################## ufw enabled ######################"
else
   echo "############################## Failed to enable ufw ###################"
fi
############################################
sudo ufw allow 8080 1> /dev/null 

if [ $? -eq 0 ];then
   echo "############################## port 8080 opend ######################"
else
   echo "############################## Failed to open port 8080 ###################"
fi
############################################
echo "installation has been finish , open you browser : http://ip_address_or_domain:8080 "
echo"your password will be :"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo "enjoy it :) "


































