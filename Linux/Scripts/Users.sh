#!/bin/bash

#============================================
# By: Jarred Cassidy
# Date: 12/11/2026
# Assignement 2
# Users.sh
#============================================


# Creates an automated report 

# this maks the script exit immediately if any command exits with a non-zero status, which helps to catch errors early and prevent the script from continuing in an unexpected state.
set -e

#variable set up

#define paths

LOG_DIR="/UserLogs"

# requirement 5 on the assgment 
#creeates a variable to store the current month and year in the format "MonthYear" (e.g., "January2026"). This variable will be used to generate the log file name for the current month and year.
CURRENT_MONTH_YEAR=$(date +"%B%Y")
LOG_FILE="$LOG_DIR/$CURRENT_MONTH_YEAR.log"

#requrement 4 create the folder if it does no exist

if [ ! -d "$LOG_DIR" ]; then
    mkdir -p "$LOG_DIR"
    echo "Created log directory: $LOG_DIR"
fi

# Requiemnet 2 g- Generate the report for uer login/logout with date and time
# The last command reads the system's wtmp file and displays a list of all users who have logged in and out of the system, along with their login/logout times and other relevant information. The output is then redirected to the log file in the UserLogs directory.

echo "Generating user login/logout report for $CURRENT_MONTH_YEAR..."
last > "$LOG_FILE"

#Requirment 6 permission set up
# Set the permissions of the log file to 644 to allow read and write access for the
# set the permisission 755 to allow read, write, and execute access for the owner, and read and execute access for others
chmod 755 "$LOG_DIR"
chmod 644 "$LOG_FILE"

echo " Success! Report generated and saved to $LOG_FILE"






