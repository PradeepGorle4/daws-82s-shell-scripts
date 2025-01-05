#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%Y-%m-%d-%H-%M)

echo "Script running at $TIMESTAMP "

# Q - Write a script to reverse the content of a text file line by line and save it to a new file.
validate() {
    if [ $? -ne 0 ]
    then
        echo -e "$1........$R FAILED $N"
        exit 1
    else
        echo -e "$1........$G SUCCESS $N"
    fi
}

read -p "Please enter full file path"$'\n' source_file # $'\n' prompts input in new line. -p is prompt and stores in source_file

# source_dir="/home/ec2-user/daws-82s-shell-scripts"
# source_file=$source_dir/normal.txt

if [ ! -f "$source_file" ] # ! means not, if file source_file not exists then echo "Not exist"
then
    echo "File not exist"
    exit 1
fi

while read -r line
do
    echo "$line" | rev >> $source_file-reverse.txt # rev cmd reverse the content of each line and appends to the txt file here
done < $source_file

validate "reversing the content"


