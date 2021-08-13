#Copyright 2021 Gary Hanley - Scripting Languages Week 2.5

# Call Password Checker
#./passwordCheck.sh

bold="`tput bold`"
red="`tput setaf 1`"
green="`tput setaf 2`"
yellow="`tput setaf 3`"
blue="`tput setaf 4`"
sgr0="`tput sgr0`"

# If Password is correct Show menu and loop until 5. Exit is selected
if [ $? -eq 0 ]
then    
    echo "${blue}Select State:${sgr0}" 
    echo "${yellow}1. Western Australia"
    echo "2. Queensland"
    echo "3. Victoria"
    echo "4. NSW"
    echo "5. Tasmania"
    echo "6. ACT"
    echo "7. SA"
    echo "Or type keyword$sgr0"
    echo "0. Exit"
fi
# Run option selected
read -p "" myoption

clear

case $myoption in
    1)        
        state="WA"
        ;;
    2)  
        state="Queensland"
        ;;
    3)
        state="Victoria"
        ;;
    4)
        state="NSW"
        ;;
    5)
        state="Tasmania"
        ;;
    6)
        state="ACT"
        ;;
    7)
        state="SA"
        ;;
    0)
        #echo "Exit"
        #echo "Closing..."
        exit 0
        ;;
    *)
        state="$myoption"
esac
