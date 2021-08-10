#!/usr/bin/awk

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
END{ print "|______________________________________________________________|_______________|"; }
/[Dd]ata breach/ { count4++ }END{ print "|  Data Breaches                                               |  " count4 "          |" }
/[Hh]ack/ { count7++ }END{ print "|  Hacked                                                      |  " count7 "           |" }
/[Ll]eaked/ { count9++ }END{ print "|  Leaked                                                      |  " count9 "           |" }
/[Rr]ansomware/ { count5++ }END{ print "|  Ransomware                                                  |  " count5 "           |" }
/[Ss]tolen/ { count8++ } 
/[Dd]ata theft/ { count6++ }END{ print "|  Data theft & Stolen                                         |  " count6+count8 "           |" }
END{ print "|______________________________________________________________|_______________|"; }
 