#!/usr/bin/awk
#Copyright 2021 Gary Hanley - Scripting Languages Assignment 4
#Created - 07/08/2021
#Prints Count of Data Breaches 2018 - 2021 from website 
#https://www.webberinsurance.com.au/data-breaches-list

BEGIN { 
       
                                                        print "___________________________________________________________________________________";
                                                        print "| \033[34mYear\033[0m                                                         |   \033[34m# Data Breaches\033[0m|";
                                                        print "|______________________________________________________________|__________________|"; 
}

                                 /2021/ { count++ }END{ print "|  2021                                                        |     " count  "           |" }
                                /2020/ { count1++ }END{ print "|  2020                                                        |     " count1 "           |" }
                                /2019/ { count2++ }END{ print "|  2019                                                        |     " count2 "           |" }
                                /2018/ { count3++ }END{ print "|  2018                                                        |     " count3 "           |" }
                                                   END{ print "|  \033[33mTotal\033[0m                                                       |     \033[33m" count+count1+count2+count3 "\033[0m          |" }
                                                   END{ print "|______________________________________________________________|__________________|"; }
                                                   
                      /[Dd]ata breach/ { count4++ }END{ print "|  Data Breaches                                               |     " count4 "          |" }
                             /[Hh]ack/ { count5++ }END{ print "|  Hacked                                                      |     " count5 "           |" }
                           /[Ll]eaked/ { count6++ }END{ print "|  Leaked                                                      |     " count6 "           |" }
                       /[Rr]ansomware/ { count7++ }END{ print "|  Ransomware                                                  |     " count7 "           |" }
          /[Ss]tolen/||/[Dd]ata theft/ { count8++ }END{ print "|  Data theft & Stolen                                         |     " count8 "           |" }

        /WA/&&/[2018,2019,2020,2021]$/ { count10++ }END{ print "|  WA                                                          |     " count10 "            |" }
/Queensland/&&/[2018,2019,2020,2021]$/ { count11++ }END{ print "|  Queensland                                                  |     " count11 "            |" }
  /Victoria/&&/[2018,2019,2020,2021]$/ { count12++ }END{ print "|  Victoria                                                    |     " count12 "            |" }
       /NSW/&&/[2018,2019,2020,2021]$/ { count13++ }END{ print "|  NSW                                                         |     " count13 "           |" }
  /Tasmania/&&/[2018,2019,2020,2021]$/ { count14++ }END{ print "|  Tasmania                                                    |     " count14 "            |" }
       /ACT/&&/[2018,2019,2020,2021]$/ { count15++ }END{ print "|  ACT                                                         |     " count15 "            |" }
        /SA/&&/[2018,2019,2020,2021]$/ { count16++ }END{ print "|  SA                                                          |     " count16 "             |" }

                                                   END{ print "|______________________________________________________________|__________________|"; }

 