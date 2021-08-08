function promptMe(myLine,   yn)
{
   printf("Show all Cyber Security Data? (Y/N): ")
   cmd="read a; echo $a"
   cmd | getline yn
   close(cmd)

   return tolower(yn)
}


BEGIN { 
  
FS="-";  

{
if (promptMe($0) == "y")
    {     
     print "________________________________________________________________________________";
     print "| \033[34mCompany\033[0m                                                      |   \033[34mDate\033[0m        |";
     print "|______________________________________________________________|_______________|"; 
     printlistxx="y"
     }
}
     } # End BEGIN

{
if (NF == 2) 
    printf("| \033[33m%-60s\033[0m | \033[35m%-13s\033[0m | \n", $1, $2);         
else if (NF == 4) 
    printf("| \033[33m%-60s\033[0m | \033[35m%-13s\033[0m | \n", $1, $4);         
else if (NF == 3) 
    printf("| \033[33m%-60s\033[0m | \033[35m%-13s\033[0m | \n", $1, $3); 
} 


END { print "|______________________________________________________________|_______________|";  }

/2021/ { count++ }END{ print " " count " Data Breaches in 2021" }
/2020/ { count1++ }END{ print " " count1 " Data Breaches in 2020" }
/2019/ { count2++ }END{ print " " count2 " Data Breaches in 2019" }
/2018/ { count3++ }END{ print " " count3 " Data Breaches in 2018" }
#/ransomware/ { count4++ }END{ print " " count4 " Ransomeware attacks in 2021"}


