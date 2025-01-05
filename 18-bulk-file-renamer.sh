#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%Y-%m-%d-%H-%M)

# Q- Write a script to rename all .txt files in a directory to add a timestamp prefix (e.g., 20250103_filename.txt)

validate() {
    if [ $? -ne 0 ]
    then
        echo -e "$1........ $R FAILURE $N"
        exit 1
    else
        echo -e "$1........ $G SUCCESS $N"
    fi
}

read -p "Please enter the source directory"$'\n' source_dir

if [ ! -f "$source_dir" ]
then
    echo "Directory not exist, please provide correct directory path"
    exit 1
fi

All_text_files=$(find $source_dir -name "*.txt")

for file in $All_text_files
do
    mv $file $TIMESTAMP_$file.txt
done

validate "renaming $file to $TIMESTAMP_$file.txt"