#!/bin/bash
# By: Jarred Cassidy
# Date: 08/11/2026
# Function: Calculations
# Script: script15

echo "This script check to see if the first argument is bigger than the second"

# Check to see if we have two arguments
if [ $# -ne 2 ]
then
  echo "Usage - $0 x y"
  echo "Where x and y are summed"
  exit 1
else
  echo "$1 plus $2 is `expr $1 + $2`"
fi

exit 0