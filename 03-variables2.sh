#!/bin/bash

# This script prompts for user input

TIMESTAMP=$(date)

echo "The current date is $TIMESTAMP"

echo "Please input 1st number: "
read -s num1 # here num1 is the variable name

echo "Please input 2nd number:"
read -s num2 # here num2 is the variable name

echo "Please enter the sum:"

read -s sum # here sum is another variable name

output=$(($num1+$num2))

echo "The output is $output"

if [ $sum -ne $output ]
then 
    echo " ERROR: Output not matched. you do not know Maths. Please learn maths"
    exit 1
else
    echo "The value has not matched the output. you can proceed further with authentication"
fi


echo "Please enter your username:"

read username

echo "please enter your password:"

read -s password

echo "you are successfully authenticated"

