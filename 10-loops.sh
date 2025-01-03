#!/bin/bash

USERID=$(id -u)

TIMESTAMP=$(date +%Y-%m-%d-%H-%M)

# Assigning variables to color codes

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript.logs"
SCRIPT_NAME=$(echo $0 |cut -d "." -f1)
LOG_FILE_Name="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP"

if [ $USERID -ne 0 ]
then
    echo -e " $R ERROR::.......You are not ROOT USER $N "
    exit 1
fi

validate (){
    if [ $? -ne 0 ]
    then
        echo -e " $Y Installing $1...... $R FAILURE $N "
    else
        echo -e " $Y Installing $1...... $G SUCCESS $N "
    fi
}

pre_check (){
    if [ $? -ne 0 ]
    then
        dnf install $1 -y &>>$LOG_FILE_Name
        validate $1
    else
        echo -e " $Y $1 is already installed $N "
    fi
}

for package in $@
do
    dnf list installed $package &>>$LOG_FILE_Name
    pre_check $package &>>$LOG_FILE_Name
done
