#!/bin/bash

# This script is for installing the softwares

#first we can check if the user has root access or not

TIMESTAMP=$(date)
USERID=$(id -u)

echo "you are running the script at $TIMESTAMP"

if [ $USERID -eq 0 ]
then
    echo "you are root user. you can proceed with installation"
else
    echo "ERROR::....You are not root user"
    exit 1
fi

# Then let us proceed to check if the packange is already installed before proceeding with installation

yum list installed git

if [ $? -eq 0 ]
then 
    echo "GIT.... is already installed"
else
    dnf install git -y
    if [ $? -eq 0 ] # Here, we are validating if the software installation is success or failure
    then
        echo "INSTALLING GIT.......SUCCESS"
    else
        echo "INSTALLING GIT.......FAILURE"
        exit 1
    fi
fi

#Let us intall mysql

yum list installed mysql

if [ $? -eq 0 ]
then
    echo "MYSQL....is already installed"
else
    dnf install mysql -y
    if [ $? -eq 0 ]
    then 
        echo "INSTALLING MYSQL........SUCCESS"
    else
        echo "INSTALLING MYSQL........FAILURE"
        exit 1
    fi
fi

echo "THANKS FOR RUNNING THE SCRIPT"




