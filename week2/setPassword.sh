#!/bin/bash

read -p "Type the name of the folder you would like to create : " folderName
read -sp "Add a password : " password
mkdir "$folderName" # Make Folder
cd $folderName
echo $password | sha256sum > secret.txt
echo
echo "Password Set"
exit 0