#!/bin/bash
while IFS= read -r line; do
   if [[ -d $line ]]; then
    echo "$line This is a directory"
elif [[ -f $line ]]; then
    echo "$line - This file exists."
else
    echo "$line - I don't know what that is!"
fi
done < "$1"