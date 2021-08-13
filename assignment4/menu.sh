#Copyright 2021 Gary Hanley - Scripting Languages Week 2.5

# Call Password Checker
#./passwordCheck.sh

clear

bold="`tput bold`"
red="`tput setaf 1`"
green="`tput setaf 2`"
yellow="`tput setaf 3`"
blue="`tput setaf 4`"
sgr0="`tput sgr0`"

# If Password is correct Show menu and loop until 5. Exit is selected
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
        echo "${red}Not a valid option${sgr0}"
        ;;
esac
done

exit 0