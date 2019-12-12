#!/bin/bash
echo
sleep 1
echo " *"
sleep 1
echo " *"
sleep 1
echo " *** Welcome to conta_cv_volume script made by haykzaryan ***"
sleep 2
echo " *** Have a nice day! ***"
echo
echo
#Copies the content of my repository to your Hugo's "public" folder 
cp $(find /home/$(whoami) \( ! -regex '.*/\..*' \) -path "*conta_cv_volume" 2> /dev/null)/* $(find /home/$(whoami) \( ! -regex '.*/\..*' \) -path "*public" 2> /dev/null)

#Changes directory to Hugo's "public" folder
cd $(find /home/$(whoami) \( ! -regex '.*/\..*' \) -path "*public" 2> /dev/null)

#Starts the second screen 
./script2.sh






 






