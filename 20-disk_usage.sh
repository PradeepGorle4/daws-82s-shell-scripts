#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%Y-%m-%d-%H-%M)

threshold=10
disk_usage=$(df -Th | grep -i xfs)
partition=$(awk -F " " {print $6F})


while read -r line
do
    $disk_usage | $partition | cut -d '%' -f1
    if [ $disk_usage -gt $threshold ]
    then
        echo "High disk usage on partition"
done <<< $disk_usage
