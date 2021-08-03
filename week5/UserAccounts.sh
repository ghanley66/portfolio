#!/bin/bash
#Copyright 2021 Gary Hanley - Scripting Languages Week 5.5
#Created - 03/08/2021
# Advanced AWK - Format /etc/passwd in neat Table

awk 'BEGIN {

    FS=":";

    print "_______________________________________________________________________________________________";

    print "| \033[34mUsername\033[0m            | \033[34mUserID\033[0m   | \033[34mGroupID\033[0m  | \033[34mHome\033[0m                      | \033[34mShell\033[0m                |";
    print "|_____________________|__________|__________|___________________________|______________________|";

}
#Show only users who have "/bin/bash" listed as default Shell
{ if ($7 == "/bin/bash")
    printf("| \033[33m%-19s\033[0m | \033[35m%-8s\033[0m | \033[35m%-8s\033[0m | \033[35m%-25s\033[0m | \033[35m%-20s\033[0m |\n", $1, $3, $4, $6, $7);

}

END {

    print "|_____________________|__________|__________|___________________________|______________________|";

}' /etc/passwd
exit 0