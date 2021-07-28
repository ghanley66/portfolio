#!/bin/bash

while read -p "${bold}${blue}Please type the URL of a file to download or type 'exit' to quit:${sgr0}" url
do
    if [ "$url" = "exit" ]; then
        echo "${bold}${red}Closing...${sgr0}"
        exit 1
    else    
        
        read -p "${bold}${green}Type the location of where you would like to download the file to:${sgr0}" loc
        filename=$(basename "$url")  
        echo -e "${bold}${red}Saving... $loc/$filename ${sgr0}"

        wget --directory-prefix=$loc/ $url
            
        
    fi

done

