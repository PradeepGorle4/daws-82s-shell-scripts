#!/bin/bash

# This script prompts for user input

TIMESTAMP=$(date)

# This script is improved version of the last variables scipt

echo "The current date is $TIMESTAMP"

read -p "Please input the 1st number: " num1

read -p "Please input the 2nd number: " num2

read -p "Please input the 3rd number: " sum

output=$(($num1+$num2))

echo "The output is $output"

if [ $sum -ne $output ]
then 
    echo " ERROR: Output not matched. you do not know Maths. Please learn maths"
    exit 1 # This is the exit status, you can give anything other than 0 if you want to exit the script
else
    echo "The value has not matched the output. you can proceed further with authentication"
fi


echo "Please enter your username:"

read username

echo "please enter your password:"

read -s password

echo "you are successfully authenticated"