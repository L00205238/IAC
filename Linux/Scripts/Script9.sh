#!/bin/bash
# By: Jarred Cassidy
# Date: 08/11/2026
# Function: Check language for hello greeting
# Script: script9

echo "press [ctrl][c] to exit"

while read f
do
case $f in
    Hello)                 echo English    ;;
    "Dia Duit")            echo Irish          ;;
    Ciao)                  echo Italian       ;;
    *)                     echo Unknown: $f
;;
esac
done
exit 0