#!/bin/bash
salt="3245678906789045689"
read -p "Type the name of the folder you would like to create : " folderName
read -sp "Add a password : " password
mkdir "$folderName" # Make Folder
cd $folderName
echo -n $password$salt | sha256sum > secret.txt
echo -n $password | sha256sum > secretnosalt.txt
echo
echo "Password Set"
exit 0