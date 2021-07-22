#!/bin/bash

# Gary Hanley - Scripting Languages Week 2.4

# Ask user to enter Password to check
read -sp "Enter the Secret Password : " password

# Add encrypted password to variable to use later
spass="$(echo "$password" | sha256sum )"
echo
#echo "spass = " $spass

# get stored password from text file
tpass=$(<password/secret.txt)
#echo "tpass = " $tpass

echo
# Check that the passwords match
if [[ $spass  == $tpass ]] ; then
    echo "Access Granted"
    exit 0
else
    echo "Access Denied" 
    echo "GoodBye"
    exit 1
fi
