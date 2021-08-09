#!/bin/bash

url="https://www.webberinsurance.com.au/data-breaches-list"

    if [ "$url" = "exit" ]; then
        echo "${bold}${red}Closing...${sgr0}"
        exit 1
    else    
        
        #read -p "${bold}${green}Type the location of where you would like to download the file to:${sgr0}" loc
        filename=$(basename "$url")  
        echo -e "${bold}${red}Saving... $loc/$filename ${sgr0}"

        curl -s $url > output   

        grep '<h3>.*</h3>' output | 
        sed -n '/<h3>/ {
            s/<[^>]*>//g
            s/&#8211;/-/g
            s/&#8217;//g
            s/2017, reported //;  s/Update//
            s/January//g; s/February//g;s/March//g; s/April//g;s/May//g; s/June//g;s/July//g; s/August//g;s/September//g; s/October//g;s/November//g; s/December//g
            p
            }' > temp.txt

    #sed -i '/Air India - May 2021/,$!d' temp.txt

    #awk 'NR > 10 END{print NR}' temp.txt

    #awk 'NR > 9 { print }' < temp.txt

    #sed -i '/Air India -  2021/,$!d' temp.txt

        awk 'NR > 9 { 
            
            FS="[-|]";  
            #print NF;
            { if (NF == 2)
                printf("%-60s %-25s \n", $1, $2); 
            else if (NF == 3)
                printf("%-60s %-25s \n", $1, $3);  
            else if (NF == 4)
                printf("%-60s %-25s \n", $1, $4);  
            }
            }' temp.txt > output.txt

        awk 'BEGIN { FS="[-|]"; }

            NR > 9 { 
            #

            #print NF;
            if (NF == 2)
                printf("| \033[33m%-60s\033[0m | \033[35m%-25s\033[0m | \n", $1, $2); 
            else if (NF == 4)
                printf("| \033[33m%-60s\033[0m | \033[35m%-25s\033[0m | \n", $1, $4); 
            else if (NF == 3)
                printf("| \033[33m%-60s\033[0m | \033[35m%-25s\033[0m | \n", $1, $3); 

            gsub(/^[ \t]+|[ \t]+$/, "", $1)
            #gsub(/^[ \t]+|[ \t]+$/, "", $2)
            #gsub(/^[ \t]+|[ \t]+$/, "", $3)
            #gsub(/^[ \t]+|[ \t]+$/, "", $4)
            
            }' temp.txt

    fi