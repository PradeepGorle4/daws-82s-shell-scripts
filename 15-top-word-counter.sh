#!/bin/bash

# colors

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%Y-%m-%d-%H-%M)

while -r read line
do
 for word in $line
	echo "word='$word'"
done < 04-arrays.sh