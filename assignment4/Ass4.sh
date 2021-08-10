#!/bin/bash
#Copyright 2021 Gary Hanley - Scripting Languages Assignment 4
#Created - 03/08/2021
#Bash script to get Cyber Security Data from a website abd present it in a table and chart
#Default run Prints out a table of Count of Breaches by Year in a table
#Command Line parameters "L" and "C" 
#"L" - Prints out a list of all Data Breaches 2018 -2021
#"C" - Shows a bar chart as well
#Run like ./Ass4.sh or ./Ass4.sh L or ./Ass4.sh C or ./Ass4.sh L C or ./Ass4.sh C L

#curl website to output.txt
url="https://www.webberinsurance.com.au/data-breaches-list"
curl=$(which curl) 
outfile="output.txt" 

if [ "$url" = "exit" ]; then
    echo "${bold}${red}Closing...${sgr0}"
    exit -1
fi

#Scrape webpage with curl
function scrape_webpage() {
    $curl -s $url > $outfile   
}

#Remove unwanted text and clean up html
function format_html() {
    sed -i '/<h3>.*2021<\/h3>/,$!d' $outfile
    #sed -i '/<h3>.*<\/h3>/,$!d' $outfile
    #sed -i '/<h3>.*\\d{4}<\/h3>/,$!d' $outfile
    grep '.*' $outfile | sed -n '/[<h3><li>]/ {
    s/<[^>]*>//g
    s/&#8211; 2020/ -  2020/g
    s/&#8211;  July 2018/ - July 2018/g
    s/&#8211;/-/g
    s/&#8217;//g
    s/2017, reported //;  s/Update//
    s/January//g; s/February//g; s/March//g; s/April//g; s/May//g; s/June//g; 
    s/July//g; s/August//g; s/September//g; s/October//g; s/November//g; s/December//g
    p
    }' > temp.txt
    
    #sed -i 1,10d temp.txt    
}

#Logical script to Print based on Command line input
function print_data() {
#Commented this out to use command line parameters instead
#read -p "Show all Cyber Security Data? (Y/N): "  -n 1 -r
#if [[ $REPLY =~ ^[Yy]$ ]]

echo 
#If Command Line Parameter == "List" then show list
if [ "$1" == "List" ] || [ "$2" == "List" ] || [ "$3" == "List" ]
then
    #Print List
    echo "Significant Data Breaches Past 4 years:"

    awk -f ass4list.awk temp.txt
fi

#If Command Line Parameter == "Count" then show list
if [ "$1" == "Count" ] || [ "$2" == "Count" ] || [ "$3" == "Count" ]
then
    #Print Count 
    echo "Significant Data Breaches Past 4 years:"
    awk -f ass4.awk temp.txt;
fi

#If Command Line Parameter == "Chart" then show Chart
if [ "$1" == "Chart" ] || [ "$2" == "Chart" ] || [ "$3" == "Chart" ]
then
    #create data file for gnuplot
    awk -f bar_data.awk temp.txt > bar_data.dat
    # Plot Bar chart
    gnuplot -persist bar_data_config.gnu
fi
}

echo

#Run Script Functions
scrape_webpage
format_html
print_data $1 $2 $3

exit 0