#!/bin/bash

userid=$(id -u)

# colors

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


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
        dnf install $1 -y
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
    dnf list installed $package
    validate $package
done