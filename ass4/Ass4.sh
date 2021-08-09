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
    sed -i '/<h3>.*2021<\/h3>/,$!d' $outfile
    #sed -i '/<h3>.*\\d{4}<\/h3>/,$!d' $outfile
    #sed -i '/<h3>.*[2021,2020,2019,2018]<\/h3>/,$!d' $outfile
    #sed -i '/LimeVPN/,$!d' $outfile

    grep '.*' $outfile | 
    sed -n '/[<h3><li>]/ {
    s/<[^>]*>//g
    s/&#8211;/-/g
    s/&#8217;//g
    s/2017, reported //;  s/Update//
    #s/[January,February,March,April,May,June,July,August,September,October,November,December]//g
    p
    }' > temp.txt

    

    #sed -i 1,10d temp.txt    
}

function print_data() {
#read -p "Show all Cyber Security Data? (Y/N): "  -n 1 -r
echo    # (optional) move to a new line
#if [[ $REPLY =~ ^[Yy]$ ]]


if [[ "$1" == "L" ]] || [[ "$2" == "L" ]]
then
    #awk '/.*-.*[0-9]{4}$/ {print}' temp.txt
    awk -f ass4list.awk temp.txt
fi
    awk -f ass4.awk temp.txt;
echo $2
if [[ "$1" == "G" ]] || [[ "$2" == "G" ]]
then
    awk -f bar_data.awk temp.txt > bar_data.dat
    gnuplot -persist bar_data_config.gnu
fi
}


#filename=$(basename "$url")  
echo -e "Significant Data Breaches Past 4 years:"

scrape_webpage
format_html
print_data $1 $2