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

# The below are the functions we use in the scirpt

precheck_&_installation () {          # This is for checking if the package is already installed and installing if not
    if [ $? -eq 0 ]
    then
        echo "$1....is already installed"
    else
        dnf install $1 -y
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

precheck_&_installation "git"

validate "GIT"


#Let us intall mysql

yum list installed mysql

precheck_&_installation "mysql"

validate "MYSQL"

# Let us install nginx

yum list installed nginx

precheck_&_installation "nginx"

validate "NGINX"

echo "Thanks for using the script. Hope you had good experience"




