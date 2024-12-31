#!/bin/bash

echo "This script is for learning special variables"

#Even though you have not declared any variables here, when you pass args while executing, the script automatically stores them in the special variables.

#Even if you don't define or explicitly mention variables in the script, arguments can be passed when executing the script from the 
#command line, and special variables (like $1, $2, $#, etc.) automatically capture these arguments, allowing you to use them inside the script. ###

echo "All variables passed:: $@"
echo "Number of variables passed:: $#"
echo "script_name:: $0 "
echo "Present working directory:: $PWD"
echo "Home directory of current user:: $HOME"
echo "which user is running the script:: $USER"

echo "Process id of the current script:: $$"

sleep 30 &
echo "Process id of the last executed background process:: $!"