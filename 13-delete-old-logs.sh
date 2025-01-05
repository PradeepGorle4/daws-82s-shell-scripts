#!/bin/bash

USERID=$(id -u)

# Assigning variables to color codes

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

set -x &>>$LOG_FILE
# Storing the logs

TIMESTAMP=$(date +%Y-%m-%d-%H-%M)

log_folder="/var/log/shell-script.logs"
script_name=$(echo $0 | cut -d "." -f1)
LOG_FILE=$log_folder/$script_name-$TIMESTAMP

source_dir="/home/ec2-user/app-logs"

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


if [ -d $source_dir ]
then
    echo "source_dir exist"
else
    echo "Source dir does not exist"
    exit 1
fi

old_files=$(find $source_dir -name "*.log" -mtime +14)

if [ -z $old_files ];
then
    echo -e "$G There are no old log files currently $N"
    exit 1
else
    echo -e "$R The files to be deleted are:\n$old_files $N"
fi

while read -r file # here, we are not using line keyword as it is a reserved keyword for reading lines in files
do
    rm -rf $file
    validate "Deleting $file"
done <<< $old_files # <<< as we are reading the output of a variable, not a file. For file < is enough

