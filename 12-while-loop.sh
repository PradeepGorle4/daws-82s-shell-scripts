#!/bin/bash

while read -r line
do
    echo $line
done < file1

i=1

while read -r line
do 
    while [ $i -le 4 ] ;
    do
        echo $line
        ((i++))
    done
done
    

