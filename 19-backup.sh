#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%Y-%m-%d-%H-%M)

source_dir=$1
destination_dir=$2
days=${3:-14} # If user dont input $3, use 14 as default days. "no gap b/w 3: and -14", if gap it is different


if [ $# -lt 2 ]
then
    echo "ERROR: please provide source dir and destination dir as input parameters while running the script"
    exit 1
fi

validate_dir() {
    if [ ! -d "$1" ]
    then
        echo "$1 does not exist"
        exit 1
fi
}
 
 validate_dir $source_dir
 validate_dir $destination_dir

backup_files=$(find $source_dir -name "*.log" -mtime +$days)

if [ -n "$backup_files" ] # Tests if the string inside the brackets is non-empty.So If backup_files in non-empty, then true, proceed.
then
    echo "The files requiring backup are: $backup_files"
    zip_file="$destination_dir/app_logs-$TIMESTAMP.zip"
    find $source_dir -name "*.log" -mtime +$days | -@ zip "$zip_file"
    if [ -f "$zip_file" ]
    then
        echo "Backup of log file older than $days is successful"
        while read -r file
        do
            rm -rf $file
            if [ $? -ne 0 ]
            then
                echo "Unable to delete $file"
                exit 1
            else
                echo "Successfully deleted $file"
            fi
    else
        echo "Backup failure"
        exit 1
    fi

 # The script still needs logging and some improvements which will be done later
