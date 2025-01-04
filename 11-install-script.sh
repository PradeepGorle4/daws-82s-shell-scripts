#!/bin/bash

userid=$(id -u)

# colors

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%Y-%m-%d-%H-%M)

log_folder="/var/log/shell-script.logs"
script_name=$(echo $0 | cut -d "." -f1)
LOG_FILE=$log_folder/$script_name-$TIMESTAMP

if [ $userid -ne 0 ]
then
    echo -e " $R ERROR: you are not root user $N"
    exit 1
fi

validate () {
    if [ $? -eq 0 ]
    then
        echo -e " $Y $1 is already installed $N"
    else
        dnf install $1 -y &>> $LOG_FILE
        if [ $? -eq 0 ]
        then
            echo -e "Installing $1 ........ $G SUCCESS $N"
        else
            echo -e "Installing $1 ........$R FAILURE $N"
        fi
    fi
}

for package in $@
do
    dnf list installed $package $>> $LOG_FILE
    validate $package
done