 #!/bin/bash

blue="\e[34m"
green="\e[32m"
red="\e[31m"
purple="\e[35m"
endcolour="\e[0m"

while [ $? -eq 0 ]
do
    echo "--------------------------------------"
    echo "Enter an Equation: q to quit:"
    echo -e "${blue}Addition eg. 3 + 2 "
    echo -e "${green}Subtraction eg. 3 - 2 " 
    echo -e "${red}Multiplication eg. 3 x 2 "
    echo -e "${purple}Division eg. 4 / 2 ${endcolour}"

    read num1 vop num2

    if [ "$num1" = "q" ]; then
        #echo "Exit"
        echo "Closing..."
        exit 0
    fi

    case $vop in
        +)
            # code if match
            echo -e "${blue}Answer = $(expr $num1 + $num2)${endcolour}"
            ;;
        -)
            # code if match 
            echo -e "${green}Answer = $(expr $num1 - $num2)${endcolour}"
            ;;
        x)
            # code if match
            echo -e "${red}Answer = $(expr $num1 \* $num2)${endcolour}"
            ;;
        /)  # default case
            echo -e "${purple}Answer = $(expr $num1 / $num2)${endcolour}"
            ;;
    esac

done
exit 0