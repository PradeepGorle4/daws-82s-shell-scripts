#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%Y-%m-%d-%H-%M)

# Q- Write a script that replaces a specific word in a text file with another word provided as input arguments.

validate() {
    if [ $? -ne 0 ]
    then
        echo -e "$1........ $R FAILURE $N"
        exit 1
    else
        echo -e "$1........ $G SUCCESS $N"
    fi
}

read -p "Please enter the full file path"$'\n' source_file

if [ ! -f "$source_file" ]
then
    echo "File not exist, please provide correct file path"
    exit 1
fi

read -p "Please enter the word you want to replace"$'\n' word_to_replace
read -p "Please enter the word to be replace with"$'\n' Replace_with

sed -i s/$word_to_replace/SBIN/g $source_file
validate "Replacing $word_to_replace with $Replace_with"