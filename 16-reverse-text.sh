#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%Y-%m-%d-%H-%M)

# Q - Write a script to reverse the content of a text file line by line and save it to a new file.
validate() {
    if [ $? -ne 0 ]
    do
        echo -e "$1........$R FAILED $N"
        echo -e "$1........$G SUCCESS $N"
}

source_dir="/home/ec2-user/daws-82s-shell-scripts"
source_file=$source_dir/normal.txt

while read -r line
do
	echo "$line" | rev >> reverse.txt # rev cmd reverse the content of each line and appends to the txt file here
    validate "reversing the content"
done < $source_file


