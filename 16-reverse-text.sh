#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%Y-%m-%d-%H-%M)

# Q - Write a script to reverse the content of a text file line by line and save it to a new file.

while read -r line
do
	echo "$line" | rev >> reverse.txt # rev cmd reverse the content of each line and appends to the txt file here
done < abc.txt


