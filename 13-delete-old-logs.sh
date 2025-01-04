#!/bin/bash

USERID=$(id -u)

# Assigning variables to color codes

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# Storing the logs

TIMESTAMP=$(date +%Y-%m-%d-%H-%M)

echo "Script running at $TIMESTAMP"

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

mkdir -p $LOGS_FOLDER
validate "Creating logs folder"

old_files=$(find . -name "*.log" -mtime +14)

for file in $old_files
do
    echo "Deleting $file"
    rm -rf $file
    validate "Deleting $file"
done
