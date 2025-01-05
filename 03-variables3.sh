#!/bin/bash

# This script is improved version of the last variables scipt

TIMESTAMP=$(date)

echo "The current date is $TIMESTAMP"

#Here, -p is to prompt the user for input and read it and store it in num1 in same line. reduces length and increase readability.

read -p "Please input the 1st number: "\n num1 # \n prompts in next line

read -p "Please input the 2nd number: " num2

read -p "Please input the sum : " sum

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