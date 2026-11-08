#!/bin/bash
# By: Jarred Cassidy
# Date: 17/11/2026
# Function: Show the process tree
# Script: script3
echo " The following processes are running"
ps -f
read -p "Press return to continue"
echo "This script will show the process tree for" $HOSTNAME
read -p "Press return to continue"
pstree | less
exit 0