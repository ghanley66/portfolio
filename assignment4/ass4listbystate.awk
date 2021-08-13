#!/usr/bin/awk
#Prints List of Data Breaches 2018 - 2021 from website 
#https://www.webberinsurance.com.au/data-breaches-list


# Format List #{for (i=1; i<=NF; i++) { if($i == "<h3>") { print i - 1; exit} } }

/<h3>/{myvar = $0}/Victoria/{ print myvar }


