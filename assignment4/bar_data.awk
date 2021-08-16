#!/usr/bin/awk
#Copyright 2021 Gary Hanley - Scripting Languages Assignment 4
#Created - 07/08/2021
#Exports Data Breaches 2018 - 2021 from website for dat file for Chart
#https://www.webberinsurance.com.au/data-breaches-list

/2018/ { count3++ }END{ print "2018 "count3 }
/2019/ { count2++ }END{ print "2019 "count2 }
/2020/ { count1++ }END{ print "2020 "count1 }
/2021/ { count++ }END{ print "2021 "count }


