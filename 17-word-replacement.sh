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
}

source_file="/home/ec2-user/daws-82s-shell-scripts/passwd.txt"

read -p "Please enter the word you want to replace" word_to_replace
read -p "Please enter the word to be replace with" Replace_with

sed -i s/$word_to_replace/SBIN/g $source_file
validate "Replacing $word_to_replace with $Replace_with"