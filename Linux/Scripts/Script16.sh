#!/bin/bash
# By: Jarred Cassidy  
# Date: 08/11/2026
# Function: Calculations
# Script: script16

if [ $# -ne 1 ]
then
  echo "Usage - $0 x"
  echo "Where x will be tested"
  exit 1
fi

echo "This script checks one argument"

if [ $1 -lt 0 ]
then
  echo "$1 is less than zero"
elif [ $1 -eq 0 ]
then
  echo "$1 is zero!"
elif [ $1 -gt 0 ]
then
  echo "$1 is greater than zero"
fi
exit 0