# By: Jarred Cassidy
# Date: 12/11/2026

# Assignement 2

# Create the log folder called UserLogs in the Linux directory if it does not exist

mkdir -p /Linux/UserLogs

#Generate the filename for the log file based on the current month and year

FILENAME=$(date +"%B%Y").log


# Append the output of the last command to the log file in the UserLogs directory
last > /Linux/UserLogs/$FILENAME

# Set the permissions of the log file to 755 to allow read, write, and execute access for the owner, and read and execute access for others
chmod 755 /Linux/UserLogs

# Set the permissions of the log file to 644 to allow read and write access for the owner, and read access for others
chmod 644 /Linux/UserLogs/$FILENAME


# Set up a cron job to run this script at the end of the month and append the output to the log file in the UserLogs directory. The cron job will run the script at 11:59 PM on the last day of every month.    
cron 

Code snippet
59 23 28-31 * * [ "$(date -d tomorrow +\%d)" == "01" ] && /Linux/Users.sh


