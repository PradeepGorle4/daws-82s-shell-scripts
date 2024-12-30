#!/bin/bash

# The first part of the script is for variables

person1=Ramesh  # there is no space for assigning variables
person2=Suresh

echo "$person2: Hi $person1, how are you..?"
echo "$person1: yaa, I'm good. Thank you $person2"

# The second part of the script is for arguments, we can input arguments while running the script

num1=$1
num2=$2

sum=($num1+$num2)

echo " The output is $sum"

echo "Thanks for running the script. Hope you got clarity on variables and argumensts or args"
