#!/usr/bin/awk
#Copyright 2021 Gary Hanley - Scripting Languages Assignment 4
#Created - 08/08/2021
#Prints List of Data Breaches 2018 - 2021 from website 
#https://www.webberinsurance.com.au/data-breaches-list

BEGIN { 
  
FS="-";  
#Format Header of Table  
print "__________________________________________________________________________________";
print "| \033[34mCompany\033[0m                                                      |      \033[34mYear\033[0m        |";
print "|______________________________________________________________|__________________|"; 
} # End BEGIN
# Format List
/.*-.*[0-9]{4}$/ {
if (NF == 2) 
    printf("| \033[33m%-60s\033[0m | \033[32m%-15s\033[0m  | \n", $1, $2);         
else if (NF == 4) 
    printf("| \033[33m%-60s\033[0m | \033[32m%-15s\033[0m  | \n", $1, $4);         
else if (NF == 3) 
    printf("| \033[33m%-60s\033[0m | \033[32m%-15s\033[0m  | \n", $1, $3); 
else
    printf("| \033[33m%-60s\033[0m | \033[35m%-15s\033[0m  | \n", $1, $2);   
} 
# Close table
END { print "|______________________________________________________________|__________________|";  }