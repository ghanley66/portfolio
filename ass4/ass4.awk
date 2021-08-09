BEGIN {
print "________________________________________________________________________________";
print "| \033[34mYear\033[0m                                                         |\033[34m# Data Breaches\033[0m|";
print "|______________________________________________________________|_______________|"; 
}

       /2021/ { count++ }END{ print "|  2021                                                        |  " count  "           |" }
      /2020/ { count1++ }END{ print "|  2020                                                        |  " count1 "           |" }
      /2019/ { count2++ }END{ print "|  2019                                                        |  " count2 "           |" }
      /2018/ { count3++ }END{ print "|  2018                                                        |  " count3 "           |" }
                         END{ print "|  \033[33mTotal\033[0m                                                       |  \033[33m" count+count1+count2+count3 "\033[0m          |" }
 /[Rr]ansomware/ { count4++ }END{ print "|  Ransomware                                                  |  " count4 "           |" }
/[Dd]ata breach/ { count5++ }END{ print "|  Data Breach                                                 |  " count5 "          |" }
     /([Dd]ata theft)|(stolen)/ { count6++ }END{ print "|  Data theft                                                  |  " count6 "           |" }
#/ransomware/ { count4++ }END{ print " " count4 " Ransomeware attacks in 2021"}

 