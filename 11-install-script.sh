#!/bin/bash

userid=(id -u)


check_root () {
    if [ $? -ne 0 ]
    then
        echo "ERROR: you are not root user"
        exit 1
    fi
}

validate () {
    if [ $? -eq 0 ]
    then
        echo "Git is already installed"
    else
        dnf install $1 -y
        if [ $? -eq 0 ]
        then
            echo "Installing $1 ........SUCCESS"
        else
            echo "Installing $1 ........FAILURE"
        fi
    fi
}

dnf list installed git
validate git

dnf list installed mysql
validate mysql

dnf list installed nginx
validate nginx

