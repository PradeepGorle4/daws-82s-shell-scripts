#!/bin/bash

# This script is improved version of the last variables scipt

TIMESTAMP=$(date)

R="\e[31m"
G="\e[32m]"
N="\e[0m"

echo "The current date is $TIMESTAMP"

#Here, -p is to prompt the user for input and read it and store it in num1 in same line. reduces length and increase readability.

validate_integer () {
    local input=$1 # local is just to mention that this assignment only works in this function.
    if ! [ $input =~ ^[0-9]+$ ]
    then
        echo -e" $R ERROR: The input should be in numbers. Please recheck your input or enter properly $N "
        exit 1
    fi
}

read -p "Please input the 1st number: "$'\n' num1 # $'\n' prompts in next line
validate_integer "$num1"

read -p "Please input the 2nd number: "$'\n' num2
validate_integer "$num2"

read -p "Please input the sum : "$'\n' sum
validate_integer "$sum"

output=$(($num1+$num2))

echo "The output is $output"

if [ $sum -ne $output ]
then 
    echo -e" $R ERROR: Output not matched. you do not know Maths. Please learn maths $N"
    exit 1 # This is the exit status, you can give anything other than 0 if you want to exit the script
else
    echo "The value has matched the output. you can proceed further with authentication"
fi

read -p "Please enter your username:" username

read -sp "please enter your password:" password # here the input should not be displayed on screen, so silent read -s

echo "you are successfully authenticated"
