#!/bin/bash

cd ~/scripts/portfolio
#grep -r 'sed '
#grep -r '^m'
#grep -rP '\s\d{4}\s'
#grep -rP '\d{4}' | grep -rPv '\d{5}'
grep -rP 'echo.*\w{3}\s+'
#gawk -r 'NF>6'
