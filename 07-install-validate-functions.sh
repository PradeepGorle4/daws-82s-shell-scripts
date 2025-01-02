#!/bin/bash

# This script is for installing the softwares

#first we can check if the user has root access or not

TIMESTAMP=$(date)
USERID=$(id -u)

echo "you are running the script at $TIMESTAMP"

if [ $USERID -ne 0 ]
then
    echo "ERROR::....You are not root user"
    exit 1
fi

# The below are the functions we use in the scirpt

precheck () {          # This is for checking if the package is already installed and installing if not
    if [ $? -eq 0 ]
    then
        echo "$1....is already installed"
    else
        dnf install $1 -y
        validate $1
    fi
}

validate () {
    if [ $? -eq 0 ] # Here, we are validating if the software installation is success or failure
    then
        echo "INSTALLING $1.......SUCCESS"
    else
        echo "INSTALLING $1.......FAILURE"
        exit 1
    fi
}

# Then let us proceed to check if the packange is already installed before proceeding with installation

yum list installed git

precheck "git"

#Let us intall mysql

yum list installed mysql

precheck "mysql"

# Let us install nginx

yum list installed nginx

precheck "nginx"

echo "Thanks for using the script. Hope you had good experience"




