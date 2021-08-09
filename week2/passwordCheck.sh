#!/bin/bash
#Copyright 2021 Gary Hanley - Scripting Languages Week 2.4
#Created - 22/07/2021
#PasswordCheck - Checks entered password against encrypted secret.txt
#Allows access if correct else Exits

#Set colour variables
bold="`tput bold`"
green="`tput setaf 2`"
blue="`tput setaf 4`"
red="`tput setaf 1`"
sgr0="`tput sgr0`"

# Ask user to enter Password to check
read -esp "${red}Enter the Secret Password : ${sgr0}" password

# Add encrypted password to variable to use later
spass="$(echo "$password" | sha256sum )"

#echo "spass = " $spass

# get stored password from text file
tpass=$(<~/scripts/portfolio/week2/password/secret.txt)
#echo "tpass = " $tpass

echo
# Check that the passwords match
if [[ $spass  == $tpass ]] ; then
    echo "${green}Access Granted${sgr0}"
    exit 0
else
    echo "${red}Access Denied${sgr0}" 
    echo "GoodBye"
    exit 1
fi
exit 0