#!/bin/bash

MOVIES=("pushpa" "RRR" "KGF" "Bahubali")

echo "First Movie :: ${MOVIES[0]}"
echo "Second Movie :: ${MOVIES[1]}"
echo "Third movie :: ${MOVIES[2]}"
echo "Fourth movie :: ${MOVIES[3]}"

echo "All movies are :: ${MOVIES[@]}"
echo "Total number of movies are:: ${#MOVIES[@]}"