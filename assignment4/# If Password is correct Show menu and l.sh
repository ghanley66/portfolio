    # If Password is correct Show menu and loop until 5. Exit is selected
if [ $? -eq 0 ]
then
    
    echo
    echo "${blue}Select State:${sgr0}" 
    echo "${yellow}1. Western Australia"
    echo "2. Queensland"
    echo "3. Victoria"
    echo "4. NSW"
    echo "5. Tasmania"
    echo "6. ACT"
    echo "7. SA$sgr0"
    echo "8. Exit"
fi
# Run option selected
read -p "" myoption

case $myoption in
    1)
        clear
        state="WA"
        ;;
    2)   
        clear     
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
    8)
        #echo "Exit"
        #echo "Closing..."
        exit 0
        ;;
esac
    echo "State is $state"
    sed -i -n "/$state/p" temp.txt