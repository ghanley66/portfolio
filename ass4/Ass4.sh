#!/bin/bash

url="https://www.webberinsurance.com.au/data-breaches-list"
curl=$(which curl) 
outfile="output.txt" 

if [ "$url" = "exit" ]; then
    echo "${bold}${red}Closing...${sgr0}"
    exit -1
fi

function scrape_webpage() {
    $curl -s $url > $outfile   
}

function format_html() {
    grep '.*' $outfile | 
    sed -n '/[<h3><li>]/ {
    s/<[^>]*>//g
    s/&#8211;/-/g
    s/&#8217;//g
    s/2017, reported //;  s/Update//
    s/January//g; s/February//g;s/March//g; s/April//g;s/May//g; s/June//g;
    s/July//g; s/August//g;s/September//g; s/October//g;s/November//g; s/December//g
    p
    }' > temp.txt

    sed -i '/India/,$!d' temp.txt

    #sed -i 1,10d temp.txt    
}

function print_data() {
#read -p "Show all Cyber Security Data? (Y/N): "  -n 1 -r
echo    # (optional) move to a new line
#if [[ $REPLY =~ ^[Yy]$ ]]


if [[ "$1" == "L" ]]
then
    #awk '/.*-.*[0-9]{4}$/ {print}' temp.txt
    awk -f ass4list.awk temp.txt
fi
    awk -f ass4.awk temp.txt;

    awk -f bar_data.awk temp.txt > bar_data

    gnuplot bar_data_config.gnu
}


#filename=$(basename "$url")  
echo -e "Significant Data Breaches Past 4 years:"

scrape_webpage
format_html
print_data $1