#!/bin/bash

USERID=$(id -u)

# Assigning variables to color codes

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# Storing the logs

TIMESTAMP=$(date +%Y-%m-%d-%H-%M)

log_folder="/var/log/shell-script.logs"
script_name=$(echo $0 | cut -d "." -f1)
LOG_FILE=$log_folder/$script_name-$TIMESTAMP

source_dir="/home/ec-user/app-logs"

echo "Script started executing at $TIMESTAMP" &>>$LOG_FILE

check_root() {
    if [ $USERID -ne 0 ]
then
    echo -e " $R ERROR::.......You must have root user access to execute this script $N "
    exit 1
fi
}

validate() {
    if [ $? -ne 0 ]
    then
        echo "$1 .......FAILED"
        exit 1
    else
        echo "$1 .......SUCCESS"
    fi
}

mkdir -p $log_folder

old_files=$(find $source_dir -name "*.log" -mtime +14)

echo "The files to be deleted are: $old_files"

# for file in $old_files
# do
#     echo "Deleting $file"
#     rm -rf $file
#     validate "Deleting $file"
# done
