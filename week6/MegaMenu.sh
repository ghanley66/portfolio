#!/bin/bash
#Copyright 2021 Gary Hanley - Scripting Languages Week 3.6
#Created - 26/07/2021
#MegaMenu - A secured menu to run various scripts
#After entering correct password the user can access the menu.

clear

bold="`tput bold`"
red="`tput setaf 1`"
green="`tput setaf 2`"
yellow="`tput setaf 3`"
blue="`tput setaf 4`"
sgr0="`tput sgr0`"

#Call Password Checker
~/scripts/portfolio/week2/passwordCheck.sh

# If Password is correct Show menu and loop until 8. Exit is selected
while [ $? -eq 0 ]
do
    echo
    echo "${blue}Select an Option:${sgr0}" 
    echo "${yellow}1. Week 1: Second.sh"
    echo "2. Week 2: PasswordCheck.sh"
    echo "3. Week 3: MegaMenu.sh"
    echo "4. Week 4: IPAddressesOnly.sh"
    echo "5. Week 5: UserAccounts.sh"
    echo "6. Week 6: BruteForce.py${sgr0}"    
    echo "0. Exit"

    # Run option selected
    # INPUTS:   myoption
    #
    read -p "" myoption

    case $myoption in
        1)
            #Open Hi There
            ../week1/second.sh
            ;;
        2)
            #Open Password Checker
            ../week2/passwordCheck.sh
            ;;
        3)
            #echo "Set Password"
            ../week3/MegaMenu.sh
            ;;
        4)
            #echo "Calculator"
            ../week4/IpAddressesOnly.sh
            ;;
        5)
            #echo "Create Week Folders:"
            ../week5/UserAccounts.sh
            ;;
        6)
            #echo "Check Filenames:"
            ../week6/BruteForce.py
            ;;
        0)
            #echo "Exit"
            echo "Closing...."
            exit 1
            ;;
    esac
done
exit 0