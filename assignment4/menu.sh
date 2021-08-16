#!/bin/bash
#Copyright 2021 Gary Hanley - Scripting Languages Assignment 4
#Created - 03/08/2021
#Displays Menu for Assignment 4

# Call Password Checker
#./passwordCheck.sh

#This function prints a given error
printError()
{
    echo -e "\033[31mERROR:\033[0m $1"
}

clear

#set variables for colours
bold="`tput bold`"
red="`tput setaf 1`"
green="`tput setaf 2`"
yellow="`tput setaf 3`"
blue="`tput setaf 4`"
sgr0="`tput sgr0`"

# If Password is correct Show menu and loop until 0. Exit is selected
while [ $? -eq 0 ]
do
    
    figlet "Assignment 4"

    echo
    echo "${blue}Select an Option:${sgr0}" 
    echo "${yellow}1. Data Breaches By Year"
    echo "2. List All Data Breaches"
    echo "3. List Data Breaches by State/Keyword"
    echo "4. Display Chart"
    echo "5. Show All${sgr0}"
    echo "0. Exit"

# Run option selected
read -p "" myoption

case $myoption in
    1)
        #echo "Data Breaches By Year"
        clear
        ./Ass4.sh Count
        ;;
    2)
        #tree
        #echo "List All Data Breaches"
        clear
        ./Ass4.sh List
        ;;
    3)
        #tree
        #echo "List All Data Breaches"
        clear
        ./Ass4.sh State
        ;;
    4)
        #echo "Display Chart"
        clear
        figlet "Chart"
        ./Ass4.sh Chart
        ;;
    5)
        #echo "All:"
        ./Ass4.sh Chart List Count
        ;;
    0)
        #echo "Exit"
        echo "Closing..."
        exit 0
        ;;
    *)  
        printError "Not a valid option!"
        ;;
esac
done

exit 0