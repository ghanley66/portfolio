#!/bin/bash

#Copyright 2021 Gary Hanley - Scripting Languages Week 2

read -p "Copy a Folder Name: " folderName

#if the name is a valid directory

if [ -d "$folderName" ]; then

    #copy it to a new location

    read -p "Type the name of the Destination Folder: " newFolderName

    cp -r "$folderName" "$newFolderName"

else

    #otherwise, print an error

    echo "I couldn't find that folder"

fi