#!/bin/bash

echo "This script is for learning special variables"

echo "All variables passed:: $@"
echo "Number of variables passed:: $#"
echo "script_name:: $0 "
echo "Present working directory:: $PWD"
echo "Home directory of current user:: $HOME"
echo "which user is running the script:: $USER"

echo "Process id of the current script:: $$"

sleep 30 &
echo "Process id of the last executed background process:: $!"