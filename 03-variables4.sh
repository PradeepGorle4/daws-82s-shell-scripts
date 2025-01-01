#!/bin/bash

# This script is improved version of the last variables scipt

TIMESTAMP=$(date)

echo "The current date is $TIMESTAMP"

# First let us validate if the input is an integer or not and throw error if not.

validate_integer () {
    local input=$1
    if ! [[ $input =~ ^[0-9]+$ ]] # =~ is to check the regular expression matching, checks if left side matches regular exp on right.
    then
        echo "ERROR::......$input is not a valid integer" 
        exit 1
    fi
}

# ^ indicates start of matching, [0-9], then + mean one or more digits(40, 52 etc.), $ means end of string

#Here, -p is to prompt the user for input and read it and store it in num1 in same line. reduces length and increase readability.

read -p "Please input the 1st number: " num1
validate_integer "num1"

read -p "Please input the 2nd number: " num2
validate_integer "num2"

read -p "Please input the sum : " sum
validate_integer "sum"

output=$(($num1+$num2))

echo "The output is $output"

if [ $sum -ne $output ]
then 
    echo " ERROR: Output not matched. you do not know Maths. Please learn maths"
    exit 1 # This is the exit status, you can give anything other than 0 if you want to exit the script
else
    echo "The value has matched the output. you can proceed further with authentication"
fi

read -p "Please enter your username:" username

read -sp "please enter your password:" password # here the input should not be displayed on screen, so silent read -s

echo "you are successfully authenticated"