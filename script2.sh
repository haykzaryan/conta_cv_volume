#!/bin/bash

#Creates volume with  (deletes the old volumes and containers in case if you have already executed the script 1 or more times)
docker stop apache_cv
docker rm apache_cv
docker volume rm volume_cv
docker volume create volume_cv


#Creates temporal container with our volume, mounted in /data 
docker container run -dit --name ubuntu_cv -v volume_cv:/data ubuntu:trusty

#Copy the hugo's cv's content to our volume
docker cp . ubuntu_cv:/data

#Deletes the container
docker container rm -fv ubuntu_cv
cd ..
rm -rf conta_cv_volume


#Creates Apache container with our volume, mounted in /usr/local/apache2/htdocs/

docker run -dit --name  apache_cv  -v volume_cv:/usr/local/apache2/htdocs/ httpd:2.4

#Deletes the content of repository which was copied to our volume.  
docker exec apache_cv rm htdocs/script1.sh htdocs/script2.sh htdocs/README.md

#Shows Container's IP to user
echo
echo "|"
echo "|"
echo "|"
echo "|"
echo  " ————> HERE IS YOUR IP ADDRESS:" $(docker exec -i apache_cv hostname -I)
echo

firefox http://172.17.0.2/



 






