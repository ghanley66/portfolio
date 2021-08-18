#Copyright 2021 Gary Hanley - Scripting Languages Week 2.5

# Call Password Checker
#./passwordCheck.sh

# If Password is correct Show menu
if [ $? -eq 0 ]
then
    echo
    echo "Select an option:"
    echo "1. Create a Folder"
    echo "2. Copy a Folder"
    echo "3. Set a Password"
    echo "4. Assignment 4"
fi

# Run option selected
read -p "" myoption

case $myoption in
    1)
        #echo "Create Folder"
        ./folderCreator.sh
        ;;
    2)
        tree
        #echo "Copy Folder"
        ./folderCopier.sh
        ;;
    3)
        #echo "Set Password:"
        ./setPassword.sh
        ;;
    4)
        #echo "Assignment 4:"
        /home/gary/scripts/portfolio/assignment4/Ass4.sh
        ;;
esac

exit 0
