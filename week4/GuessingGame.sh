#!/bin/bash
#This function prints a given error
printError()
{
    echo -e "\033[31mERROR:\033[0m $1"
}

printCorrect()
{
    echo -e "\033[32mCORRECT:\033[0m $1"
}

#This function will get a value between the 2nd and 3rd arguments
getNumber()

{

    read -p "$1: "

    #echo "REPLY = $r"

    while (( $REPLY < $2 || $REPLY > $3 )); do

        printError "Input must be between $2 and $3"
        read -p "$1: "

    done

    if [[ $REPLY -eq $r ]]; then
        printCorrect "CORRECT!"
        exit 0
    elif [[ $REPLY -lt $r ]]; then
        printError "Too Low!"            
    elif [[ $REPLY -gt $r ]]; then
        printError "Too High!"         
    fi

            getNumber "please type a number between 1 and 100" 1 100
}

echo "This is the start of the script"
    r=$((1 + $RANDOM % 100))
    #echo "MyNum = " $r

getNumber "please type a number between 1 and 100" 1 100
echo "Thank you!"

