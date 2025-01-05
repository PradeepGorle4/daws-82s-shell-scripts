#!/bin/bash

# colors

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%Y-%m-%d-%H-%M)

while read -r line
do
    for word in $line
	do 
        echo "word=$word"
    done
done < 04-arrays.sh