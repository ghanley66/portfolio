#!/bin/bash
#Copyright 2021 Gary Hanley - Scripting Languages Week 3.6
#Created - 26/07/2021
#MegaMenu - A secured menu to run various scripts
#After entering correct password the user can access the menu.

clear
figlet "Menu"

bold="`tput bold`"
red="`tput setaf 1`"
green="`tput setaf 2`"
yellow="`tput setaf 3`"
blue="`tput setaf 4`"
sgr0="`tput sgr0`"

#Call Password Checker
~/scripts/portfolio/week2/passwordCheck.sh

# If Password is correct Show menu and loop until 9. Exit is selected
while [ $? -eq 0 ]
do
    clear
    figlet "Menu"

    echo "${blue}Select an Option:${sgr0}" 
    echo "${yellow}1. Create a Folder"
    echo "2. Copy a Folder"
    echo "3. Set a Password"
    echo "4. Calculator"
    echo "5. Create Week Folders"
    echo "6. Check Filenames"
    echo "7. Download a File"
    echo "${green}8. Assignment 4${sgr0}"    
    echo "0. Exit"

    # Run option selected
    # INPUTS:   myoption
    #
    read -p "" myoption

    case $myoption in
        1)
            #echo "Create Folder"
            ../week2/folderCreator.sh
            ;;
        2)
            tree
            #echo "Copy Folder"
            ../week2/folderCopier.sh
            ;;
        3)
            #echo "Set Password"
            ../week2/setPassword.sh
            ;;
        4)
            #echo "Calculator"
            ../week3/calculator.sh
            ;;
        5)
            #echo "Create Week Folders:"
            ../week3/megafoldermaker.sh
            ;;
        6)
            #echo "Check Filenames:"
            ../week3/filenames.sh filenames.txt
            ;;
        7)
            #echo "Downlaod a File"
            ../week3/downloader.sh
            ;;
        8)
            #echo "Assignment 4:"
            ../assignment4/menu.sh
            ;;            
        0)
            #echo "Exit"
            echo "Closing..."
            exit 1
            ;;
    esac
done
exit 0