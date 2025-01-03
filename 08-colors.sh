#!/bin/bash

USERID=$(id -u)

TIMESTAMP=$(date +%Y-%m-%d)

# Assigning variables to color codes

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


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
        echo -e " $Y Installing.....$1 $N "
        dnf install $1 -y
        validate $1
    else
        echo -e " $Y $1 is already installed $N "
    fi
}

dnf list installed git

pre_check git

dnf list installed mysql

pre_check mysql
    
