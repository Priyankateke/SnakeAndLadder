#!/bin/bash -x

echo "Welcome To Snake And Ladder"

#variables
playerPosition=0

dieValue=$(( RANDOM % 6 + 1 ))
