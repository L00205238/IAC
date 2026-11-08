#!/bin/bash
# By: Jarred Cassidy
# Date: 08/11/2026
# Function: Simple number check
# Script: script10

X=-4
# Check if less than
if [ "$X" -lt "0" ]
then
    echo "X is less than zero"
    exit 0
else
    echo "X is greater than zero"
    exit 0
fi